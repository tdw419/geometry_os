; DESCRIPTION: Renders a blue box of size 66x13 starting at (98, 139).
; PLAN: r0=98(x), r1=139(y), r2=66(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 139
LDI r2, 66
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
