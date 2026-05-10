; DESCRIPTION: Renders a blue box of size 45x26 starting at (126, 68).
; PLAN: r0=126(x), r1=68(y), r2=45(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 68
LDI r2, 45
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
