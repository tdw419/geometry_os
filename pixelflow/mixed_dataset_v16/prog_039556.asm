; DESCRIPTION: Creates a magenta rectangular region at (97, 116) spanning 31 by 77 pixels.
; PLAN: r0=97(x), r1=116(y), r2=31(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 116
LDI r2, 31
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
