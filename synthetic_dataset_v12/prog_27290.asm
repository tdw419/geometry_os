; DESCRIPTION: Places a purple 90x49 rectangle at position (14, 87).
; PLAN: r0=14(x), r1=87(y), r2=90(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 87
LDI r2, 90
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
