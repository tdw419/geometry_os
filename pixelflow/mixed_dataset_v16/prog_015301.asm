; DESCRIPTION: Creates a purple filled rectangle of size 56x82 starting at (51, 52).
; PLAN: r0=51(x), r1=52(y), r2=56(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 52
LDI r2, 56
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
