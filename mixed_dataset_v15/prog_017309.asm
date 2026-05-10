; DESCRIPTION: Creates a magenta rectangular region at (32, 167) spanning 81 by 39 pixels.
; PLAN: r0=32(x), r1=167(y), r2=81(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 167
LDI r2, 81
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
