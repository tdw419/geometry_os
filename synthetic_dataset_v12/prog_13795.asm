; DESCRIPTION: Creates a black rectangular region at (252, 134) spanning 117 by 101 pixels.
; PLAN: r0=252(x), r1=134(y), r2=117(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 134
LDI r2, 117
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
