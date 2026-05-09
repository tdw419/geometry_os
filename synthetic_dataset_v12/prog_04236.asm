; DESCRIPTION: Composite: Draws a red line from (221, 3) to (224, 173) then Sets a single orange pixel at (25, 8) then Renders a blue box of size 97x62 starting at (374, 183).
; PLAN: r0=221(x1), r1=3(y1), r2=224(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=8(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=374(x), r11=183(y), r12=97(width), r13=62(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 3
LDI r2, 224
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 8
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 374
LDI r11, 183
LDI r12, 97
LDI r13, 62
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
