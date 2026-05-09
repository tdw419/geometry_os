; DESCRIPTION: Composite: Places a orange line segment connecting (356, 221) to (240, 156) then Sets a single orange pixel at (238, 19) then Creates a orange circular shape at (81, 139) with radius 24.
; PLAN: r0=356(x1), r1=221(y1), r2=240(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=19(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=81(x), r11=139(y), r12=24(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 356
LDI r1, 221
LDI r2, 240
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 19
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 81
LDI r11, 139
LDI r12, 24
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
