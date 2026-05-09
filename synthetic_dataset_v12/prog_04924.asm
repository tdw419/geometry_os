; DESCRIPTION: Composite: Places a green 116x113 rectangle at position (131, 116) then Sets a single magenta pixel at (246, 207) then Draws a green line from (379, 218) to (314, 113).
; PLAN: r0=131(x), r1=116(y), r2=116(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=207(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=379(x1), r11=218(y1), r12=314(x2), r13=113(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 116
LDI r2, 116
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 207
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 379
LDI r11, 218
LDI r12, 314
LDI r13, 113
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
