; DESCRIPTION: Creates a purple rectangular region at (438, 207) spanning 27 by 41 pixels.
; PLAN: r0=438(x), r1=207(y), r2=27(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 207
LDI r2, 27
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
