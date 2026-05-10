; DESCRIPTION: Places a yellow 67x74 rectangle at position (164, 179).
; PLAN: r0=164(x), r1=179(y), r2=67(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 179
LDI r2, 67
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
