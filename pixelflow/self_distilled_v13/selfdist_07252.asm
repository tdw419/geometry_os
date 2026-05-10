; DESCRIPTION: Runs a simple loop 22 times, decrementing a counter each iteration.
; PLAN: r0=243(x), r1=225(y), r2=22(width), r3=1(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 225
LDI r2, 22
LDI r3, 1
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
