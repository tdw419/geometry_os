; DESCRIPTION: Composite: . Then Places a blue line segment connecting (175, 144) to (209, 152). Then Draws a magenta rectangle at (95, 36) with width 119 and height 98.
; PLAN: r0=175(x1), r1=144(y1), r2=209(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=36(y), r2=119(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (175, 144) to (209, 152).
; PLAN: r0=175(x1), r1=144(y1), r2=209(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 144
LDI r2, 209
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (95, 36) with width 119 and height 98.
; PLAN: r0=95(x), r1=36(y), r2=119(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 36
LDI r2, 119
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
