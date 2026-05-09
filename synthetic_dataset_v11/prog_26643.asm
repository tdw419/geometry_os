; DESCRIPTION: Composite: . Then Draws a green rectangle at (26, 127) with width 92 and height 65. Then Draws a purple line from (131, 96) to (90, 159).
; PLAN: r0=26(x), r1=127(y), r2=92(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=131(x1), r1=96(y1), r2=90(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (26, 127) with width 92 and height 65.
; PLAN: r0=26(x), r1=127(y), r2=92(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 127
LDI r2, 92
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (131, 96) to (90, 159).
; PLAN: r0=131(x1), r1=96(y1), r2=90(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 96
LDI r2, 90
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
