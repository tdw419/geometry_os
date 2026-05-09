; DESCRIPTION: Creates a magenta rectangular region at (343, 168) spanning 39 by 83 pixels.
; PLAN: r0=343(x), r1=168(y), r2=39(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 168
LDI r2, 39
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
