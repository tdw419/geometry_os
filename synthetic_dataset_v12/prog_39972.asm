; DESCRIPTION: Creates a magenta rectangular region at (85, 42) spanning 29 by 113 pixels.
; PLAN: r0=85(x), r1=42(y), r2=29(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 42
LDI r2, 29
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
