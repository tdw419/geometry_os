; DESCRIPTION: Composite: Renders a cyan disk with center (188, 184) and radius 45 then Places a blue line segment connecting (396, 4) to (89, 132).
; PLAN: r0=188(x), r1=184(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x1), r6=4(y1), r7=89(x2), r8=132(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 184
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 4
LDI r7, 89
LDI r8, 132
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
