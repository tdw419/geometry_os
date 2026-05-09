; DESCRIPTION: Places a purple 83x85 rectangle at position (196, 67).
; PLAN: r0=196(x), r1=67(y), r2=83(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 67
LDI r2, 83
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
