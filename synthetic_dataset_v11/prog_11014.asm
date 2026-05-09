; DESCRIPTION: Composite: . Then Places a orange line segment connecting (186, 238) to (13, 57). Then Draws a magenta rectangle at (53, 181) with width 46 and height 28.
; PLAN: r0=186(x1), r1=238(y1), r2=13(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=53(x), r1=181(y), r2=46(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (186, 238) to (13, 57).
; PLAN: r0=186(x1), r1=238(y1), r2=13(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 238
LDI r2, 13
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (53, 181) with width 46 and height 28.
; PLAN: r0=53(x), r1=181(y), r2=46(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 181
LDI r2, 46
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
