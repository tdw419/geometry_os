; DESCRIPTION: Composite: Draws a red line from (160, 59) to (288, 20) then Sets a single red pixel at (195, 222) then Draws a cyan rectangle at (68, 72) with width 42 and height 107.
; PLAN: r0=160(x1), r1=59(y1), r2=288(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=222(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=68(x), r11=72(y), r12=42(width), r13=107(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 59
LDI r2, 288
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 222
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 68
LDI r11, 72
LDI r12, 42
LDI r13, 107
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
