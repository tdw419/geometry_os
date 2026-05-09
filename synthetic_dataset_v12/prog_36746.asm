; DESCRIPTION: Draws a magenta rectangle at (198, 13) with width 19 and height 25.
; PLAN: r0=198(x), r1=13(y), r2=19(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 13
LDI r2, 19
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
