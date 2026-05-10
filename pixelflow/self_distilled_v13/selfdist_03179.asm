; DESCRIPTION: Creates a blue filled rectangle of size 10x66 starting at (51, 108).
; PLAN: r0=51(x), r1=108(y), r2=10(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 108
LDI r2, 10
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
