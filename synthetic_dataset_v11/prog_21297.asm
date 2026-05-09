; DESCRIPTION: Creates a yellow rectangular region at (176, 137) spanning 41 by 46 pixels.
; PLAN: r0=176(x), r1=137(y), r2=41(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 137
LDI r2, 41
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
