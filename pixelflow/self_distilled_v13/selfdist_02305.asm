; DESCRIPTION: Creates a blue filled rectangle of size 51x95 starting at (282, 69).
; PLAN: r0=282(x), r1=69(y), r2=51(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 69
LDI r2, 51
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
