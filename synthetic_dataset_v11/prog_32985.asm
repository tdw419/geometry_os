; DESCRIPTION: Creates a magenta rectangular region at (42, 101) spanning 116 by 21 pixels.
; PLAN: r0=42(x), r1=101(y), r2=116(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 101
LDI r2, 116
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
