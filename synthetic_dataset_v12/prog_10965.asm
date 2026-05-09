; DESCRIPTION: Places a cyan 35x18 rectangle at position (334, 67).
; PLAN: r0=334(x), r1=67(y), r2=35(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 67
LDI r2, 35
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
