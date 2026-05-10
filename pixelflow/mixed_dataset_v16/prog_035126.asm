; DESCRIPTION: Composite: Creates a purple rectangular region at (429, 169) spanning 81 by 19 pixels then Draws a black line from (254, 97) to (280, 198).
; PLAN: r0=429(x), r1=169(y), r2=81(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x1), r6=97(y1), r7=280(x2), r8=198(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 169
LDI r2, 81
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 97
LDI r7, 280
LDI r8, 198
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
