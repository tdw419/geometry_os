; DESCRIPTION: Renders a blue box of size 63x26 starting at (228, 49).
; PLAN: r0=228(x), r1=49(y), r2=63(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 49
LDI r2, 63
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
