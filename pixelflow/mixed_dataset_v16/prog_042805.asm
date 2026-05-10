; DESCRIPTION: Runs a simple loop 7 times, decrementing a counter each iteration.
; PLAN: r0=74(x), r1=7(y), r2=74(width), r3=1(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 7
LDI r2, 74
LDI r3, 1
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
