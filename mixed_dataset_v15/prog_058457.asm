; DESCRIPTION: Creates a orange filled rectangle of size 81x51 starting at (141, 171).
; PLAN: r0=141(x), r1=171(y), r2=81(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 171
LDI r2, 81
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
