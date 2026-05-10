; DESCRIPTION: Creates a orange rectangular region at (28, 138) spanning 101 by 31 pixels.
; PLAN: r0=28(x), r1=138(y), r2=101(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 138
LDI r2, 101
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
