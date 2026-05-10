; DESCRIPTION: Runs a simple loop 41 times, decrementing a counter each iteration.
; PLAN: r0=41(x), r1=41(y), r2=41(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 41
LDI r2, 41
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
