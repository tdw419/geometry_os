; DESCRIPTION: Runs a simple loop 21 times, decrementing a counter each iteration.
; PLAN: r0=34(x), r1=21(y), r2=21(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 21
LDI r2, 21
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
