; DESCRIPTION: Creates a black rectangular region at (352, 13) spanning 13 by 89 pixels.
; PLAN: r0=352(x), r1=13(y), r2=13(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 13
LDI r2, 13
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
