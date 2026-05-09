; DESCRIPTION: Composite: Creates a orange rectangular region at (4, 70) spanning 113 by 105 pixels then Draws a cyan line from (394, 110) to (186, 32) then Draws a orange circle centered at (128, 217) with radius 34.
; PLAN: r0=4(x), r1=70(y), r2=113(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=110(y1), r7=186(x2), r8=32(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=128(x), r11=217(y), r12=34(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 4
LDI r1, 70
LDI r2, 113
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 110
LDI r7, 186
LDI r8, 32
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 217
LDI r12, 34
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
