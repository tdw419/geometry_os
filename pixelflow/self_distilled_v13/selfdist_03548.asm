; DESCRIPTION: Runs a simple loop 45 times, decrementing a counter each iteration.
; PLAN: r0=441(x), r1=10(y), r2=45(width), r3=1(height), r4=0x00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 10
LDI r2, 45
LDI r3, 1
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
