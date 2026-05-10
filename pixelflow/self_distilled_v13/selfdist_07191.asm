; DESCRIPTION: Runs a simple loop 13 times, decrementing a counter each iteration.
; PLAN: r0=13(x), r1=132(y), r2=10(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 132
LDI r2, 10
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
