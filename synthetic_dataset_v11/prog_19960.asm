; DESCRIPTION: Creates a orange rectangular region at (53, 126) spanning 118 by 114 pixels.
; PLAN: r0=53(x), r1=126(y), r2=118(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 126
LDI r2, 118
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
