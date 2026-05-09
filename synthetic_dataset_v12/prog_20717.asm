; DESCRIPTION: Composite: Places a green line segment connecting (439, 64) to (96, 159) then Creates a white circular shape at (254, 161) with radius 65.
; PLAN: r0=439(x1), r1=64(y1), r2=96(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=161(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 64
LDI r2, 96
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 161
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
