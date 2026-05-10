; DESCRIPTION: Composite: Places a orange line segment connecting (502, 224) to (165, 219) then Renders a black box of size 52x68 starting at (174, 156) then Sets a single orange pixel at (478, 233).
; PLAN: r0=502(x1), r1=224(y1), r2=165(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=156(y), r7=52(width), r8=68(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=478(x), r11=233(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 502
LDI r1, 224
LDI r2, 165
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 156
LDI r7, 52
LDI r8, 68
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 478
LDI r11, 233
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
