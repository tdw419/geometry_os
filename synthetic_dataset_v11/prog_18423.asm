; DESCRIPTION: Places a black 79x67 rectangle at position (78, 86).
; PLAN: r0=78(x), r1=86(y), r2=79(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 86
LDI r2, 79
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
