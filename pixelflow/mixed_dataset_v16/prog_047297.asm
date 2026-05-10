; DESCRIPTION: Runs a simple loop 30 times, decrementing a counter each iteration.
; PLAN: r0=30(x), r1=95(y), r2=30(width), r3=1(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 95
LDI r2, 30
LDI r3, 1
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
