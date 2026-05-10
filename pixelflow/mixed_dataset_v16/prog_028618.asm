; DESCRIPTION: Creates a red rectangular region at (383, 41) spanning 53 by 10 pixels.
; PLAN: r0=383(x), r1=41(y), r2=53(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 41
LDI r2, 53
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
