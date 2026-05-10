; DESCRIPTION: Creates a magenta rectangular region at (192, 105) spanning 42 by 59 pixels.
; PLAN: r0=192(x), r1=105(y), r2=42(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 105
LDI r2, 42
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
