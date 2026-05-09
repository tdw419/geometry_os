; DESCRIPTION: Creates a orange rectangular region at (170, 29) spanning 76 by 104 pixels.
; PLAN: r0=170(x), r1=29(y), r2=76(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 29
LDI r2, 76
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
