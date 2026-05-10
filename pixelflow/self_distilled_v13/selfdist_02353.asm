; DESCRIPTION: Runs a simple loop 25 times, decrementing a counter each iteration.
; PLAN: r0=442(x), r1=25(y), r2=25(width), r3=25(height), r4=0x00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 25
LDI r2, 25
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
