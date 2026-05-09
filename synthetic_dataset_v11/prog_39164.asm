; DESCRIPTION: Places a purple 67x81 rectangle at position (170, 80).
; PLAN: r0=170(x), r1=80(y), r2=67(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 80
LDI r2, 67
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
