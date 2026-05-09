; DESCRIPTION: Renders a blue box of size 86x26 starting at (139, 223).
; PLAN: r0=139(x), r1=223(y), r2=86(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 223
LDI r2, 86
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
