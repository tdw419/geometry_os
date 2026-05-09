; DESCRIPTION: Composite: Places a orange line segment connecting (133, 33) to (401, 139) then Creates a blue circular shape at (126, 167) with radius 55.
; PLAN: r0=133(x1), r1=33(y1), r2=401(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=167(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 33
LDI r2, 401
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 167
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
