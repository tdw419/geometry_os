; DESCRIPTION: Runs a simple loop 38 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=95(y), r2=38(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 95
LDI r2, 38
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
