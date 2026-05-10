; DESCRIPTION: Composite: Draws a white line from (196, 209) to (489, 229) then Sets a single yellow pixel at (505, 26) then Places a magenta 81x100 rectangle at position (154, 36).
; PLAN: r0=196(x1), r1=209(y1), r2=489(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=505(x), r6=26(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=154(x), r11=36(y), r12=81(width), r13=100(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 209
LDI r2, 489
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 26
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 154
LDI r11, 36
LDI r12, 81
LDI r13, 100
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
