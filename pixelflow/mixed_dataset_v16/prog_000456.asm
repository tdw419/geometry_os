; DESCRIPTION: Composite: Creates a magenta rectangular region at (173, 151) spanning 92 by 81 pixels then Sets a single magenta pixel at (373, 119) then Draws a blue line from (337, 14) to (269, 63).
; PLAN: r0=173(x), r1=151(y), r2=92(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=119(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=337(x1), r11=14(y1), r12=269(x2), r13=63(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 151
LDI r2, 92
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 119
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 337
LDI r11, 14
LDI r12, 269
LDI r13, 63
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
