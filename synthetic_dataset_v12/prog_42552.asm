; DESCRIPTION: Creates a orange rectangular region at (382, 156) spanning 37 by 34 pixels.
; PLAN: r0=382(x), r1=156(y), r2=37(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 156
LDI r2, 37
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
