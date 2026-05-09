; DESCRIPTION: Creates a magenta rectangular region at (144, 171) spanning 101 by 42 pixels.
; PLAN: r0=144(x), r1=171(y), r2=101(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 171
LDI r2, 101
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
