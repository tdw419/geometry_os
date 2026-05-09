; DESCRIPTION: Draws a magenta rectangle at (173, 199) with width 79 and height 50.
; PLAN: r0=173(x), r1=199(y), r2=79(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 199
LDI r2, 79
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
