; DESCRIPTION: Places a purple 87x107 rectangle at position (14, 51).
; PLAN: r0=14(x), r1=51(y), r2=87(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 51
LDI r2, 87
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
