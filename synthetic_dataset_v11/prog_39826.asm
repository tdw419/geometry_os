; DESCRIPTION: Places a cyan 67x24 rectangle at position (53, 8).
; PLAN: r0=53(x), r1=8(y), r2=67(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 8
LDI r2, 67
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
