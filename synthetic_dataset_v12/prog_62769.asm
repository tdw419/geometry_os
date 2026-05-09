; DESCRIPTION: Places a black 68x41 rectangle at position (368, 183).
; PLAN: r0=368(x), r1=183(y), r2=68(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 183
LDI r2, 68
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
