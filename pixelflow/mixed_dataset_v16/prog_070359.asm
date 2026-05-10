; DESCRIPTION: Creates a white filled rectangle of size 51x99 starting at (131, 82).
; PLAN: r0=131(x), r1=82(y), r2=51(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 82
LDI r2, 51
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
