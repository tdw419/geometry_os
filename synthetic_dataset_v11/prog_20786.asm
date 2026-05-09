; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (138, 137) with width 55 and height 88. Then Renders a green line between points (188, 67) and (254, 198).
; PLAN: r0=138(x), r1=137(y), r2=55(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=188(x1), r1=67(y1), r2=254(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta rectangle at (138, 137) with width 55 and height 88.
; PLAN: r0=138(x), r1=137(y), r2=55(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 137
LDI r2, 55
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green line between points (188, 67) and (254, 198).
; PLAN: r0=188(x1), r1=67(y1), r2=254(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 67
LDI r2, 254
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
