; DESCRIPTION: Composite: Renders a blue box of size 106x15 starting at (309, 128) then Places a magenta dot at position (158, 229) then Draws a yellow line from (65, 210) to (459, 73).
; PLAN: r0=309(x), r1=128(y), r2=106(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=229(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=65(x1), r11=210(y1), r12=459(x2), r13=73(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 128
LDI r2, 106
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 229
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 65
LDI r11, 210
LDI r12, 459
LDI r13, 73
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
