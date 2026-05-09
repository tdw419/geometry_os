; DESCRIPTION: Composite: . Then Places a blue line segment connecting (207, 74) to (77, 187). Then Draws a magenta rectangle at (93, 145) with width 82 and height 67.
; PLAN: r0=207(x1), r1=74(y1), r2=77(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=93(x), r1=145(y), r2=82(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (207, 74) to (77, 187).
; PLAN: r0=207(x1), r1=74(y1), r2=77(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 74
LDI r2, 77
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (93, 145) with width 82 and height 67.
; PLAN: r0=93(x), r1=145(y), r2=82(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 145
LDI r2, 82
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
