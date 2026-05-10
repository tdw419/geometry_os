; DESCRIPTION: Runs a simple loop 10 times, decrementing a counter each iteration.
; PLAN: r0=10(x), r1=10(y), r2=10(width), r3=1(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 10
LDI r2, 10
LDI r3, 1
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
