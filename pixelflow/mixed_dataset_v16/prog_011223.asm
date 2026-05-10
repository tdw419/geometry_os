; DESCRIPTION: Places a purple 120x69 rectangle at position (319, 67).
; PLAN: r0=319(x), r1=67(y), r2=120(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 67
LDI r2, 120
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
