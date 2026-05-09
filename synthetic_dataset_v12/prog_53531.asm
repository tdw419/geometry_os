; DESCRIPTION: Composite: Creates a blue rectangular region at (246, 121) spanning 102 by 120 pixels then Draws a magenta line from (128, 136) to (104, 156).
; PLAN: r0=246(x), r1=121(y), r2=102(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x1), r6=136(y1), r7=104(x2), r8=156(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 121
LDI r2, 102
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 136
LDI r7, 104
LDI r8, 156
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
