; DESCRIPTION: Places a black 41x94 rectangle at position (59, 157).
; PLAN: r0=59(x), r1=157(y), r2=41(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 157
LDI r2, 41
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
