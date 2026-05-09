; DESCRIPTION: Places a purple 24x22 rectangle at position (426, 67).
; PLAN: r0=426(x), r1=67(y), r2=24(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 67
LDI r2, 24
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
