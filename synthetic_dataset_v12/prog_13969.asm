; DESCRIPTION: Composite: Places a black dot at position (91, 4) then Draws a cyan rectangle at (116, 133) with width 79 and height 115 then Draws a yellow line from (23, 224) to (138, 40).
; PLAN: r0=91(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=133(y), r7=79(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=23(x1), r11=224(y1), r12=138(x2), r13=40(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 4
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 116
LDI r6, 133
LDI r7, 79
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 224
LDI r12, 138
LDI r13, 40
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
