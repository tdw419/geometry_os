; DESCRIPTION: Composite: . Then Draws a purple line from (151, 169) to (97, 231). Then Draws a orange rectangle at (118, 43) with width 111 and height 58.
; PLAN: r0=151(x1), r1=169(y1), r2=97(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=43(y), r2=111(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (151, 169) to (97, 231).
; PLAN: r0=151(x1), r1=169(y1), r2=97(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 169
LDI r2, 97
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange rectangle at (118, 43) with width 111 and height 58.
; PLAN: r0=118(x), r1=43(y), r2=111(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 43
LDI r2, 111
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
