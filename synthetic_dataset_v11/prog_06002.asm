; DESCRIPTION: Creates a orange rectangular region at (142, 176) spanning 101 by 71 pixels.
; PLAN: r0=142(x), r1=176(y), r2=101(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 176
LDI r2, 101
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
