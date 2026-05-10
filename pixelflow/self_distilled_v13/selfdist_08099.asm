; DESCRIPTION: Runs a simple loop 14 times, decrementing a counter each iteration.
; PLAN: r0=14(x), r1=14(y), r2=14(width), r3=1(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 14
LDI r2, 14
LDI r3, 1
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
