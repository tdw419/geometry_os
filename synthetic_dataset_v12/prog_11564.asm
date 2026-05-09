; DESCRIPTION: Creates a magenta rectangular region at (181, 136) spanning 15 by 120 pixels.
; PLAN: r0=181(x), r1=136(y), r2=15(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 136
LDI r2, 15
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
