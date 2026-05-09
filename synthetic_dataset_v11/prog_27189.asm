; DESCRIPTION: Places a white 73x68 rectangle at position (2, 67).
; PLAN: r0=2(x), r1=67(y), r2=73(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 67
LDI r2, 73
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
