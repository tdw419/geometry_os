; DESCRIPTION: Places a purple 67x18 rectangle at position (123, 237).
; PLAN: r0=123(x), r1=237(y), r2=67(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 237
LDI r2, 67
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
