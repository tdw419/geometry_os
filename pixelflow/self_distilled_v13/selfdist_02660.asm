; DESCRIPTION: Runs a simple loop 35 times, decrementing a counter each iteration.
; PLAN: r0=342(x), r1=10(y), r2=35(width), r3=5(height), r4=0x00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 10
LDI r2, 35
LDI r3, 5
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
