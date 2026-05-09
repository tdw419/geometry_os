; DESCRIPTION: Places a black 41x113 rectangle at position (230, 77).
; PLAN: r0=230(x), r1=77(y), r2=41(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 77
LDI r2, 41
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
