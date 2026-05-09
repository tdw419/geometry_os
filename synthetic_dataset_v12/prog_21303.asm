; DESCRIPTION: Places a purple 87x120 rectangle at position (55, 118).
; PLAN: r0=55(x), r1=118(y), r2=87(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 118
LDI r2, 87
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
