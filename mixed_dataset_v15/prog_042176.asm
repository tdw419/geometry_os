; DESCRIPTION: Composite: Renders a white disk with center (313, 187) and radius 33 then Places a blue line segment connecting (458, 49) to (35, 68).
; PLAN: r0=313(x), r1=187(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x1), r6=49(y1), r7=35(x2), r8=68(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 187
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 49
LDI r7, 35
LDI r8, 68
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
