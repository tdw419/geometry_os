; DESCRIPTION: Places a black 41x16 rectangle at position (380, 202).
; PLAN: r0=380(x), r1=202(y), r2=41(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 202
LDI r2, 41
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
