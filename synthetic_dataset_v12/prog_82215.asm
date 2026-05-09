; DESCRIPTION: Composite: Creates a magenta rectangular region at (358, 67) spanning 40 by 63 pixels then Draws a green line from (223, 255) to (477, 108).
; PLAN: r0=358(x), r1=67(y), r2=40(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x1), r6=255(y1), r7=477(x2), r8=108(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 67
LDI r2, 40
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 255
LDI r7, 477
LDI r8, 108
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
