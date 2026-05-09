; DESCRIPTION: Places a white 53x114 rectangle at position (142, 67).
; PLAN: r0=142(x), r1=67(y), r2=53(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 67
LDI r2, 53
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
