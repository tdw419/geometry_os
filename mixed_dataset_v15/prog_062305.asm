; DESCRIPTION: Composite: Places a black circle of radius 34 at center (304, 111) then Places a blue line segment connecting (302, 185) to (446, 176).
; PLAN: r0=304(x), r1=111(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x1), r6=185(y1), r7=446(x2), r8=176(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 111
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 185
LDI r7, 446
LDI r8, 176
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
