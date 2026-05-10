; DESCRIPTION: Creates a black rectangular region at (149, 23) spanning 89 by 104 pixels.
; PLAN: r0=149(x), r1=23(y), r2=89(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 23
LDI r2, 89
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
