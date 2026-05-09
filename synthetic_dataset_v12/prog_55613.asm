; DESCRIPTION: Places a black 73x92 rectangle at position (435, 41).
; PLAN: r0=435(x), r1=41(y), r2=73(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 41
LDI r2, 73
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
