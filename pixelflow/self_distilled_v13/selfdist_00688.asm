; DESCRIPTION: Runs a simple loop 6 times, decrementing a counter each iteration.
; PLAN: r0=41(x), r1=61(y), r2=61(width), r3=1(height), r4=0x00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 61
LDI r2, 61
LDI r3, 1
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
