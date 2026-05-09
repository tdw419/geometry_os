; DESCRIPTION: Creates a orange rectangular region at (136, 101) spanning 77 by 39 pixels.
; PLAN: r0=136(x), r1=101(y), r2=77(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 101
LDI r2, 77
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
