; DESCRIPTION: Places a black 67x11 rectangle at position (19, 58).
; PLAN: r0=19(x), r1=58(y), r2=67(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 58
LDI r2, 67
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
