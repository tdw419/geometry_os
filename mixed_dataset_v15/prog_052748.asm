; DESCRIPTION: Places a black 54x67 rectangle at position (423, 53).
; PLAN: r0=423(x), r1=53(y), r2=54(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 53
LDI r2, 54
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
