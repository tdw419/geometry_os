; DESCRIPTION: Places a cyan 29x67 rectangle at position (141, 74).
; PLAN: r0=141(x), r1=74(y), r2=29(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 74
LDI r2, 29
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
