; DESCRIPTION: Composite: Places a orange line segment connecting (140, 81) to (270, 140) then Creates a green circular shape at (262, 173) with radius 80.
; PLAN: r0=140(x1), r1=81(y1), r2=270(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=173(y), r7=80(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 140
LDI r1, 81
LDI r2, 270
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 173
LDI r7, 80
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
