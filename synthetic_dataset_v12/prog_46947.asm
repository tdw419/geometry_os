; DESCRIPTION: Creates a orange rectangular region at (382, 72) spanning 99 by 77 pixels.
; PLAN: r0=382(x), r1=72(y), r2=99(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 72
LDI r2, 99
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
