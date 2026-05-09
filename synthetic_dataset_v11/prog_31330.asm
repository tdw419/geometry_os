; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (21, 16) with width 83 and height 88. Then Renders a blue line between points (144, 49) and (24, 64).
; PLAN: r0=21(x), r1=16(y), r2=83(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=144(x1), r1=49(y1), r2=24(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta rectangle at (21, 16) with width 83 and height 88.
; PLAN: r0=21(x), r1=16(y), r2=83(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 16
LDI r2, 83
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (144, 49) and (24, 64).
; PLAN: r0=144(x1), r1=49(y1), r2=24(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 49
LDI r2, 24
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
