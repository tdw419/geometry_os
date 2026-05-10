; DESCRIPTION: Runs a simple loop 38 times, decrementing a counter each iteration.
; PLAN: r0=441(x), r1=10(y), r2=38(width), r3=38(height), r4=0x00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 10
LDI r2, 38
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
