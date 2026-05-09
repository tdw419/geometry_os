; DESCRIPTION: Composite: Creates a green rectangular region at (363, 35) spanning 81 by 17 pixels then Draws a magenta line from (476, 59) to (44, 238).
; PLAN: r0=363(x), r1=35(y), r2=81(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x1), r6=59(y1), r7=44(x2), r8=238(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 35
LDI r2, 81
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 59
LDI r7, 44
LDI r8, 238
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
