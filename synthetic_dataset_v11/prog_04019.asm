; DESCRIPTION: Composite: . Then Places a red circle of radius 21 at center (81, 91). Then Draws a magenta rectangle at (69, 112) with width 84 and height 73.
; PLAN: r0=81(x), r1=91(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=69(x), r1=112(y), r2=84(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 21 at center (81, 91).
; PLAN: r0=81(x), r1=91(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 91
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (69, 112) with width 84 and height 73.
; PLAN: r0=69(x), r1=112(y), r2=84(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 112
LDI r2, 84
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
