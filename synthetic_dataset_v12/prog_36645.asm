; DESCRIPTION: Draws a magenta rectangle at (459, 7) with width 46 and height 76.
; PLAN: r0=459(x), r1=7(y), r2=46(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 7
LDI r2, 46
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
