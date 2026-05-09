; DESCRIPTION: Creates a orange rectangular region at (119, 27) spanning 52 by 102 pixels.
; PLAN: r0=119(x), r1=27(y), r2=52(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 27
LDI r2, 52
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
