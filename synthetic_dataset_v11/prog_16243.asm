; DESCRIPTION: Composite: . Then Draws a green rectangle at (56, 133) with width 39 and height 68. Then Draws a blue line from (177, 251) to (131, 222).
; PLAN: r0=56(x), r1=133(y), r2=39(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x1), r1=251(y1), r2=131(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (56, 133) with width 39 and height 68.
; PLAN: r0=56(x), r1=133(y), r2=39(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 133
LDI r2, 39
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue line from (177, 251) to (131, 222).
; PLAN: r0=177(x1), r1=251(y1), r2=131(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 251
LDI r2, 131
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
