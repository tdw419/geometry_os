; DESCRIPTION: Renders a white box of size 102x119 starting at (389, 132).
; PLAN: r0=389(x), r1=132(y), r2=102(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 132
LDI r2, 102
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
