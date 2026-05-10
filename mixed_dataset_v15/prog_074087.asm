; DESCRIPTION: Places a black 67x30 rectangle at position (29, 99).
; PLAN: r0=29(x), r1=99(y), r2=67(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 99
LDI r2, 67
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
