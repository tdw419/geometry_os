; DESCRIPTION: Composite: Creates a black circular shape at (454, 161) with radius 40 then Places a green line segment connecting (133, 243) to (430, 234).
; PLAN: r0=454(x), r1=161(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x1), r6=243(y1), r7=430(x2), r8=234(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 161
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 243
LDI r7, 430
LDI r8, 234
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
