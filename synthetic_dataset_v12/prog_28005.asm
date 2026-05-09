; DESCRIPTION: Places a black 117x115 rectangle at position (38, 41).
; PLAN: r0=38(x), r1=41(y), r2=117(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 41
LDI r2, 117
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
