; DESCRIPTION: Draws a magenta rectangle at (173, 138) with width 56 and height 48.
; PLAN: r0=173(x), r1=138(y), r2=56(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 138
LDI r2, 56
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
