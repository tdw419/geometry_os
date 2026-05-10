; DESCRIPTION: Runs a simple loop 11 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=11(y), r2=11(width), r3=1(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 11
LDI r2, 11
LDI r3, 1
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
