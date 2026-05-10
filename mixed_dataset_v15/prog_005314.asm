; DESCRIPTION: Creates a black rectangular region at (2, 101) spanning 82 by 118 pixels.
; PLAN: r0=2(x), r1=101(y), r2=82(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 101
LDI r2, 82
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
