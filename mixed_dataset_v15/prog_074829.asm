; DESCRIPTION: Draws a magenta rectangle at (206, 59) with width 50 and height 88.
; PLAN: r0=206(x), r1=59(y), r2=50(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 59
LDI r2, 50
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
