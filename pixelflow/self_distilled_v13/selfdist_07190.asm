; DESCRIPTION: Runs a simple loop 10 times, decrementing a counter each iteration.
; PLAN: r0=40(x), r1=10(y), r2=10(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 10
LDI r2, 10
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
