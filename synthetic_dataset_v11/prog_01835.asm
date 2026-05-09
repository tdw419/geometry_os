; DESCRIPTION: Creates a magenta rectangular region at (171, 128) spanning 77 by 89 pixels.
; PLAN: r0=171(x), r1=128(y), r2=77(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 128
LDI r2, 77
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
