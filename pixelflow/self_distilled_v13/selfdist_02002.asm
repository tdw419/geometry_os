; DESCRIPTION: Runs a simple loop 9 times, decrementing a counter each iteration.
; PLAN: r0=34(x), r1=92(y), r2=94(width), r3=1(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 92
LDI r2, 94
LDI r3, 1
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
