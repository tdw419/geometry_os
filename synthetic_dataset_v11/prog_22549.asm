; DESCRIPTION: Places a red 18x100 rectangle at position (41, 124).
; PLAN: r0=41(x), r1=124(y), r2=18(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 124
LDI r2, 18
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
