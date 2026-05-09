; DESCRIPTION: Creates a purple rectangular region at (166, 56) spanning 104 by 41 pixels.
; PLAN: r0=166(x), r1=56(y), r2=104(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 56
LDI r2, 104
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
