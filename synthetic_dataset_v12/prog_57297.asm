; DESCRIPTION: Creates a purple rectangular region at (429, 58) spanning 51 by 89 pixels.
; PLAN: r0=429(x), r1=58(y), r2=51(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 58
LDI r2, 51
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
