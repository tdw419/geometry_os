; DESCRIPTION: Creates a magenta rectangular region at (397, 37) spanning 90 by 77 pixels.
; PLAN: r0=397(x), r1=37(y), r2=90(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 37
LDI r2, 90
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
