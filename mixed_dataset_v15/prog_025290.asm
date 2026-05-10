; DESCRIPTION: Composite: Creates a magenta rectangular region at (181, 92) spanning 39 by 97 pixels then Draws a blue line from (405, 8) to (204, 220).
; PLAN: r0=181(x), r1=92(y), r2=39(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x1), r6=8(y1), r7=204(x2), r8=220(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 92
LDI r2, 39
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 8
LDI r7, 204
LDI r8, 220
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
