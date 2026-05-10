; DESCRIPTION: Runs a simple loop 7 times, decrementing a counter each iteration.
; PLAN: r0=74(x), r1=7(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 7
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
