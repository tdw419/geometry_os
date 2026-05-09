; DESCRIPTION: Places a black 27x104 rectangle at position (25, 41).
; PLAN: r0=25(x), r1=41(y), r2=27(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 41
LDI r2, 27
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
