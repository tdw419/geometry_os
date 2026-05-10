; DESCRIPTION: Draws a magenta rectangle at (409, 196) with width 84 and height 38.
; PLAN: r0=409(x), r1=196(y), r2=84(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 196
LDI r2, 84
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
