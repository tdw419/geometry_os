; DESCRIPTION: Creates a orange rectangular region at (148, 109) spanning 43 by 118 pixels.
; PLAN: r0=148(x), r1=109(y), r2=43(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 109
LDI r2, 43
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
