; DESCRIPTION: Creates a magenta rectangular region at (268, 6) spanning 83 by 32 pixels.
; PLAN: r0=268(x), r1=6(y), r2=83(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 6
LDI r2, 83
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
