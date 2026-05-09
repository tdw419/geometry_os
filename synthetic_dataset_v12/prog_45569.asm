; DESCRIPTION: Composite: Places a yellow 28x23 rectangle at position (462, 228) then Sets a single magenta pixel at (118, 162) then Draws a purple line from (49, 181) to (346, 133).
; PLAN: r0=462(x), r1=228(y), r2=28(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=162(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=49(x1), r11=181(y1), r12=346(x2), r13=133(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 462
LDI r1, 228
LDI r2, 28
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 162
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 49
LDI r11, 181
LDI r12, 346
LDI r13, 133
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
