; DESCRIPTION: Places a purple 67x112 rectangle at position (217, 49).
; PLAN: r0=217(x), r1=49(y), r2=67(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 49
LDI r2, 67
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
