; DESCRIPTION: Creates a black rectangular region at (303, 101) spanning 81 by 68 pixels.
; PLAN: r0=303(x), r1=101(y), r2=81(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 101
LDI r2, 81
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
