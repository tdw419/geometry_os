; DESCRIPTION: Creates a purple rectangular region at (197, 23) spanning 41 by 34 pixels.
; PLAN: r0=197(x), r1=23(y), r2=41(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 23
LDI r2, 41
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
