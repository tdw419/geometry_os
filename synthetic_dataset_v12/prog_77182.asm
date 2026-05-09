; DESCRIPTION: Composite: Creates a blue rectangular region at (362, 99) spanning 47 by 67 pixels then Draws a purple line from (144, 95) to (387, 234).
; PLAN: r0=362(x), r1=99(y), r2=47(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x1), r6=95(y1), r7=387(x2), r8=234(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 99
LDI r2, 47
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 95
LDI r7, 387
LDI r8, 234
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
