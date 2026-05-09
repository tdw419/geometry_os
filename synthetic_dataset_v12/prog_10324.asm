; DESCRIPTION: Places a purple 15x88 rectangle at position (429, 140).
; PLAN: r0=429(x), r1=140(y), r2=15(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 140
LDI r2, 15
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
