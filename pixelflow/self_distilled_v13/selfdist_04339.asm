; DESCRIPTION: Runs a simple loop 47 times, decrementing a counter each iteration.
; PLAN: r0=47(x), r1=47(y), r2=0(width), r3=1(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 47
LDI r2, 0
LDI r3, 1
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
