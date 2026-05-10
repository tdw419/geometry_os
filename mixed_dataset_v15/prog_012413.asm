; DESCRIPTION: Places a red 89x38 rectangle at position (41, 64).
; PLAN: r0=41(x), r1=64(y), r2=89(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 64
LDI r2, 89
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
