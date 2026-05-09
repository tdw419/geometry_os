; DESCRIPTION: Places a white 116x67 rectangle at position (201, 74).
; PLAN: r0=201(x), r1=74(y), r2=116(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 74
LDI r2, 116
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
