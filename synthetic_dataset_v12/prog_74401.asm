; DESCRIPTION: Places a purple 55x107 rectangle at position (416, 67).
; PLAN: r0=416(x), r1=67(y), r2=55(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 67
LDI r2, 55
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
