; DESCRIPTION: Places a purple 67x21 rectangle at position (11, 207).
; PLAN: r0=11(x), r1=207(y), r2=67(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 207
LDI r2, 67
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
