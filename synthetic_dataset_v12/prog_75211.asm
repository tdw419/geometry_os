; DESCRIPTION: Places a black 41x88 rectangle at position (79, 17).
; PLAN: r0=79(x), r1=17(y), r2=41(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 17
LDI r2, 41
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
