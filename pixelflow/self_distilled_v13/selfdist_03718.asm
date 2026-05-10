; DESCRIPTION: Runs a simple loop 50 times, decrementing a counter each iteration.
; PLAN: r0=44(x), r1=50(y), r2=0(width), r3=1(height), r4=0x00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 50
LDI r2, 0
LDI r3, 1
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
