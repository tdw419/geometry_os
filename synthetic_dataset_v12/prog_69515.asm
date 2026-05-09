; DESCRIPTION: Places a purple 28x118 rectangle at position (392, 67).
; PLAN: r0=392(x), r1=67(y), r2=28(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 67
LDI r2, 28
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
