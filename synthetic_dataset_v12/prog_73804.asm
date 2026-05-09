; DESCRIPTION: Creates a orange rectangular region at (345, 195) spanning 88 by 41 pixels.
; PLAN: r0=345(x), r1=195(y), r2=88(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 195
LDI r2, 88
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
