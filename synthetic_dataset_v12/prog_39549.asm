; DESCRIPTION: Places a blue 67x69 rectangle at position (35, 129).
; PLAN: r0=35(x), r1=129(y), r2=67(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 129
LDI r2, 67
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
