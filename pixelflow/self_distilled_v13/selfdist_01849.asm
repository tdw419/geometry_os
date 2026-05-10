; DESCRIPTION: Runs a simple loop 35 times, decrementing a counter each iteration.
; PLAN: r0=442(x), r1=15(y), r2=35(width), r3=10(height), r4=0x00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 15
LDI r2, 35
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
