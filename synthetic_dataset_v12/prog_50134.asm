; DESCRIPTION: Creates a magenta rectangular region at (173, 87) spanning 53 by 58 pixels.
; PLAN: r0=173(x), r1=87(y), r2=53(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 87
LDI r2, 53
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
