; DESCRIPTION: Places a red 92x96 rectangle at position (41, 35).
; PLAN: r0=41(x), r1=35(y), r2=92(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 35
LDI r2, 92
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
