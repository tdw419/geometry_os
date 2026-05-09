; DESCRIPTION: Places a black 44x78 rectangle at position (67, 134).
; PLAN: r0=67(x), r1=134(y), r2=44(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 134
LDI r2, 44
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
