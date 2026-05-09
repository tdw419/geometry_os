; DESCRIPTION: Creates a magenta rectangular region at (42, 116) spanning 34 by 87 pixels.
; PLAN: r0=42(x), r1=116(y), r2=34(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 116
LDI r2, 34
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
