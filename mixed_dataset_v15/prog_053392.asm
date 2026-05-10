; DESCRIPTION: Runs a simple loop 12 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=12(y), r2=12(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 12
LDI r2, 12
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
