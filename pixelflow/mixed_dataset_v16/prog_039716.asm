; DESCRIPTION: Composite: Sets a single orange pixel at (184, 121) then Draws a white rectangle at (300, 169) with width 79 and height 67 then Renders a red line between points (433, 203) and (248, 178).
; PLAN: r0=184(x), r1=121(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=169(y), r7=79(width), r8=67(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=433(x1), r11=203(y1), r12=248(x2), r13=178(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 121
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 300
LDI r6, 169
LDI r7, 79
LDI r8, 67
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 203
LDI r12, 248
LDI r13, 178
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
