; DESCRIPTION: Composite: Creates a yellow circular shape at (454, 134) with radius 20 then Sets a single orange pixel at (300, 128) then Draws a red line from (166, 95) to (461, 132).
; PLAN: r0=454(x), r1=134(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x), r6=128(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=166(x1), r11=95(y1), r12=461(x2), r13=132(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 134
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 128
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 166
LDI r11, 95
LDI r12, 461
LDI r13, 132
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
