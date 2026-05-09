; DESCRIPTION: Creates a magenta rectangular region at (173, 72) spanning 62 by 116 pixels.
; PLAN: r0=173(x), r1=72(y), r2=62(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 72
LDI r2, 62
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
