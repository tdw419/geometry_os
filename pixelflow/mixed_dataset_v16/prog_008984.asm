; DESCRIPTION: Runs a simple loop 43 times, decrementing a counter each iteration.
; PLAN: r0=41(x), r1=95(y), r2=41(width), r3=1(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 95
LDI r2, 41
LDI r3, 1
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
