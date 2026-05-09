; DESCRIPTION: Creates a magenta rectangular region at (86, 154) spanning 49 by 83 pixels.
; PLAN: r0=86(x), r1=154(y), r2=49(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 154
LDI r2, 49
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
