; DESCRIPTION: Creates a yellow rectangular region at (126, 194) spanning 41 by 14 pixels.
; PLAN: r0=126(x), r1=194(y), r2=41(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 194
LDI r2, 41
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
