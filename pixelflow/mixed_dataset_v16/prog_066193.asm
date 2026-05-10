; DESCRIPTION: Creates a orange rectangular region at (379, 1) spanning 105 by 114 pixels.
; PLAN: r0=379(x), r1=1(y), r2=105(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 1
LDI r2, 105
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
