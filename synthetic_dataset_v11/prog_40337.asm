; DESCRIPTION: Composite: . Then Renders a blue line between points (167, 52) and (119, 247). Then Draws a red rectangle at (113, 181) with width 100 and height 37.
; PLAN: r0=167(x1), r1=52(y1), r2=119(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=113(x), r1=181(y), r2=100(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (167, 52) and (119, 247).
; PLAN: r0=167(x1), r1=52(y1), r2=119(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 52
LDI r2, 119
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (113, 181) with width 100 and height 37.
; PLAN: r0=113(x), r1=181(y), r2=100(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 181
LDI r2, 100
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
