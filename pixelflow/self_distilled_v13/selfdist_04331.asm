; DESCRIPTION: Runs a simple loop 18 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=18(y), r2=18(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 18
LDI r2, 18
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
