; DESCRIPTION: Runs a simple loop 35 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=10(y), r2=35(width), r3=1(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 10
LDI r2, 35
LDI r3, 1
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
