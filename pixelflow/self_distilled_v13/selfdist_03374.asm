; DESCRIPTION: Renders a purple rectangular region spanning 89 by 53 at (293, 149).
; PLAN: r0=293(x), r1=149(y), r2=89(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 149
LDI r2, 89
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
