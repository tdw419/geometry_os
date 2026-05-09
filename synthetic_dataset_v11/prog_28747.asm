; DESCRIPTION: Renders a black box of size 86x67 starting at (84, 139).
; PLAN: r0=84(x), r1=139(y), r2=86(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 139
LDI r2, 86
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
