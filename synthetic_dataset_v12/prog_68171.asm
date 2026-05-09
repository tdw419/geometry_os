; DESCRIPTION: Places a black 23x67 rectangle at position (237, 20).
; PLAN: r0=237(x), r1=20(y), r2=23(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 20
LDI r2, 23
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
