; DESCRIPTION: Creates a orange rectangular region at (167, 138) spanning 14 by 56 pixels.
; PLAN: r0=167(x), r1=138(y), r2=14(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 138
LDI r2, 14
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
