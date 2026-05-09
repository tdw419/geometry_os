; DESCRIPTION: Places a purple 70x53 rectangle at position (176, 67).
; PLAN: r0=176(x), r1=67(y), r2=70(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 67
LDI r2, 70
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
