; DESCRIPTION: Creates a orange rectangular region at (31, 183) spanning 51 by 67 pixels.
; PLAN: r0=31(x), r1=183(y), r2=51(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 183
LDI r2, 51
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
