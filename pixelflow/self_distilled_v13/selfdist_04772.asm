; DESCRIPTION: Runs a simple loop 15 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=153(y), r2=15(width), r3=15(height), r4=0x00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 153
LDI r2, 15
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
