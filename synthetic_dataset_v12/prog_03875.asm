; DESCRIPTION: Creates a magenta rectangular region at (466, 42) spanning 36 by 83 pixels.
; PLAN: r0=466(x), r1=42(y), r2=36(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 42
LDI r2, 36
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
