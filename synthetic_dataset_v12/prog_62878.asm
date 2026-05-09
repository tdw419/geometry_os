; DESCRIPTION: Creates a black rectangular region at (376, 41) spanning 48 by 101 pixels.
; PLAN: r0=376(x), r1=41(y), r2=48(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 41
LDI r2, 48
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
