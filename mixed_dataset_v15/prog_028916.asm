; DESCRIPTION: Composite: Places a blue line segment connecting (144, 221) to (250, 209) then Creates a orange circular shape at (312, 78) with radius 70.
; PLAN: r0=144(x1), r1=221(y1), r2=250(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=78(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 144
LDI r1, 221
LDI r2, 250
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 78
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
