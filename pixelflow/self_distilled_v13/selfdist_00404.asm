; DESCRIPTION: Runs a simple loop 28 times, decrementing a counter each iteration.
; PLAN: r0=3(x), r1=10(y), r2=37(width), r3=1(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 10
LDI r2, 37
LDI r3, 1
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
