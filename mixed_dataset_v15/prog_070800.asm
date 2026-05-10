; DESCRIPTION: Creates a white filled rectangle of size 119x12 starting at (377, 51).
; PLAN: r0=377(x), r1=51(y), r2=119(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 51
LDI r2, 119
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
