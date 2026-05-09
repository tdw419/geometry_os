; DESCRIPTION: Creates a magenta rectangular region at (113, 219) spanning 53 by 10 pixels.
; PLAN: r0=113(x), r1=219(y), r2=53(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 219
LDI r2, 53
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
