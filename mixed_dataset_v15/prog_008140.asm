; DESCRIPTION: Places a black 65x36 rectangle at position (343, 67).
; PLAN: r0=343(x), r1=67(y), r2=65(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 67
LDI r2, 65
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
