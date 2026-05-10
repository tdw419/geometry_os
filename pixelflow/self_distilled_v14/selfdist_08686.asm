; DESCRIPTION: Runs a simple loop 27 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=22(y), r2=27(width), r3=1(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 22
LDI r2, 27
LDI r3, 1
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
