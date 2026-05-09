; DESCRIPTION: Composite: Places a green dot at position (191, 61) then Creates a magenta rectangular region at (259, 19) spanning 68 by 58 pixels then Draws a magenta line from (327, 17) to (241, 60).
; PLAN: r0=191(x), r1=61(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=19(y), r7=68(width), r8=58(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x1), r11=17(y1), r12=241(x2), r13=60(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 61
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 259
LDI r6, 19
LDI r7, 68
LDI r8, 58
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 17
LDI r12, 241
LDI r13, 60
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
