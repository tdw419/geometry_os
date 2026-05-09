; DESCRIPTION: Places a black 67x71 rectangle at position (26, 149).
; PLAN: r0=26(x), r1=149(y), r2=67(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 149
LDI r2, 67
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
