; DESCRIPTION: Creates a red rectangular region at (41, 10) spanning 75 by 19 pixels.
; PLAN: r0=41(x), r1=10(y), r2=75(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 10
LDI r2, 75
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
