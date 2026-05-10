; DESCRIPTION: Composite: Creates a black rectangular region at (188, 173) spanning 53 by 19 pixels then Draws a magenta line from (452, 179) to (99, 178).
; PLAN: r0=188(x), r1=173(y), r2=53(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x1), r6=179(y1), r7=99(x2), r8=178(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 173
LDI r2, 53
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 179
LDI r7, 99
LDI r8, 178
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
