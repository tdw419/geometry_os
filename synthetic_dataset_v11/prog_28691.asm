; DESCRIPTION: Creates a purple rectangular region at (174, 143) spanning 53 by 41 pixels.
; PLAN: r0=174(x), r1=143(y), r2=53(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 143
LDI r2, 53
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
