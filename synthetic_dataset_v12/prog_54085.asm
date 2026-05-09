; DESCRIPTION: Creates a magenta rectangular region at (459, 136) spanning 18 by 16 pixels.
; PLAN: r0=459(x), r1=136(y), r2=18(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 136
LDI r2, 18
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
