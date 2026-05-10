; DESCRIPTION: Creates a blue filled rectangle of size 116x18 starting at (2, 112).
; PLAN: r0=2(x), r1=112(y), r2=116(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 112
LDI r2, 116
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
