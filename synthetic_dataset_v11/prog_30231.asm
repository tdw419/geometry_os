; DESCRIPTION: Composite: . Then Draws a blue rectangle at (114, 8) with width 62 and height 118. Then Draws a yellow line from (61, 173) to (52, 21).
; PLAN: r0=114(x), r1=8(y), r2=62(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=61(x1), r1=173(y1), r2=52(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (114, 8) with width 62 and height 118.
; PLAN: r0=114(x), r1=8(y), r2=62(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 8
LDI r2, 62
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (61, 173) to (52, 21).
; PLAN: r0=61(x1), r1=173(y1), r2=52(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 173
LDI r2, 52
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
