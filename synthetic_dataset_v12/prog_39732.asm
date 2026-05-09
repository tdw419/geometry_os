; DESCRIPTION: Creates a magenta rectangular region at (218, 156) spanning 71 by 77 pixels.
; PLAN: r0=218(x), r1=156(y), r2=71(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 156
LDI r2, 71
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
