; DESCRIPTION: Renders a yellow box of size 97x67 starting at (23, 175).
; PLAN: r0=23(x), r1=175(y), r2=97(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 175
LDI r2, 97
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
