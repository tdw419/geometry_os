; DESCRIPTION: Composite: Places a white line segment connecting (1, 79) to (197, 184) then Creates a orange circular shape at (250, 152) with radius 56.
; PLAN: r0=1(x1), r1=79(y1), r2=197(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=152(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 79
LDI r2, 197
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 152
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
