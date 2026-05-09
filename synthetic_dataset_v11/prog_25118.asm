; DESCRIPTION: Creates a red rectangular region at (143, 114) spanning 41 by 25 pixels.
; PLAN: r0=143(x), r1=114(y), r2=41(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 114
LDI r2, 41
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
