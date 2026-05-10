; DESCRIPTION: Runs a simple loop 8 times, decrementing a counter each iteration.
; PLAN: r0=41(x), r1=89(y), r2=93(width), r3=1(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 89
LDI r2, 93
LDI r3, 1
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
