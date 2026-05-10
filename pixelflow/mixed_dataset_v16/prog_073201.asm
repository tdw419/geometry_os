; DESCRIPTION: Places a cyan 29x78 box at position (254, 67).
; PLAN: r0=254(x), r1=67(y), r2=29(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 67
LDI r2, 29
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
