; DESCRIPTION: Composite: Draws a white line from (159, 96) to (422, 109) then Creates a orange rectangular region at (396, 137) spanning 81 by 103 pixels then Sets a single orange pixel at (106, 213).
; PLAN: r0=159(x1), r1=96(y1), r2=422(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=137(y), r7=81(width), r8=103(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=106(x), r11=213(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 96
LDI r2, 422
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 137
LDI r7, 81
LDI r8, 103
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 213
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
