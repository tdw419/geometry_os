; DESCRIPTION: Runs a simple loop 20 times, decrementing a counter each iteration.
; PLAN: r0=202(x), r1=203(y), r2=20(width), r3=1(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 203
LDI r2, 20
LDI r3, 1
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
