; DESCRIPTION: Runs a simple loop 50 times, decrementing a counter each iteration.
; PLAN: r0=44(x), r1=50(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 50
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
