; DESCRIPTION: Creates a red rectangular region at (41, 45) spanning 89 by 87 pixels.
; PLAN: r0=41(x), r1=45(y), r2=89(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 45
LDI r2, 89
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
