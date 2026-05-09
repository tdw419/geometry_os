; DESCRIPTION: Creates a orange rectangular region at (155, 153) spanning 72 by 87 pixels.
; PLAN: r0=155(x), r1=153(y), r2=72(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 153
LDI r2, 72
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
