; DESCRIPTION: Runs a simple loop 28 times, decrementing a counter each iteration.
; PLAN: r0=271(x), r1=10(y), r2=0(width), r3=1(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 10
LDI r2, 0
LDI r3, 1
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
