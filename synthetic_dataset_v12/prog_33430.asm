; DESCRIPTION: Places a purple 49x54 rectangle at position (453, 67).
; PLAN: r0=453(x), r1=67(y), r2=49(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 67
LDI r2, 49
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
