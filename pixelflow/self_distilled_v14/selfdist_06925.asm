; DESCRIPTION: Runs a simple loop 5 times, decrementing a counter each iteration.
; PLAN: r0=44(x), r1=5(y), r2=59(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 5
LDI r2, 59
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
