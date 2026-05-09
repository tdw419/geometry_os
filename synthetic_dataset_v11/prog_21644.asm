; DESCRIPTION: Renders a green box of size 67x108 starting at (156, 128).
; PLAN: r0=156(x), r1=128(y), r2=67(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 128
LDI r2, 67
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
