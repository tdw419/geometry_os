; DESCRIPTION: Creates a yellow rectangular region at (197, 41) spanning 96 by 89 pixels.
; PLAN: r0=197(x), r1=41(y), r2=96(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 41
LDI r2, 96
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
