; DESCRIPTION: Composite: Places a white line segment connecting (95, 7) to (236, 28) then Creates a orange rectangular region at (65, 25) spanning 18 by 11 pixels then Places a black dot at position (316, 144).
; PLAN: r0=95(x1), r1=7(y1), r2=236(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=25(y), r7=18(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=316(x), r11=144(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 7
LDI r2, 236
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 25
LDI r7, 18
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 144
LDI r12, 0x000000
PSET r10, r11, r12
HALT
