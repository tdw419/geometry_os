; DESCRIPTION: Runs a simple loop 36 times, decrementing a counter each iteration.
; PLAN: r0=441(x), r1=61(y), r2=36(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 61
LDI r2, 36
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
