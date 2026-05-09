; DESCRIPTION: Creates a red rectangular region at (226, 74) spanning 14 by 41 pixels.
; PLAN: r0=226(x), r1=74(y), r2=14(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 74
LDI r2, 14
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
