; DESCRIPTION: Runs a simple loop 8 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=89(y), r2=89(width), r3=1(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 89
LDI r2, 89
LDI r3, 1
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
