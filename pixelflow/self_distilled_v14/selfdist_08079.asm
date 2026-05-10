; DESCRIPTION: Runs a simple loop 49 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=49(y), r2=49(width), r3=1(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 49
LDI r2, 49
LDI r3, 1
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
