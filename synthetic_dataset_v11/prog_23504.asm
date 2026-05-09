; DESCRIPTION: Creates a black rectangular region at (34, 128) spanning 97 by 41 pixels.
; PLAN: r0=34(x), r1=128(y), r2=97(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 128
LDI r2, 97
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
