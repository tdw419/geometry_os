; DESCRIPTION: Places a black 73x119 rectangle at position (145, 84).
; PLAN: r0=145(x), r1=84(y), r2=73(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 84
LDI r2, 73
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
