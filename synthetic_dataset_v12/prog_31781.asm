; DESCRIPTION: Renders a blue box of size 47x42 starting at (414, 43).
; PLAN: r0=414(x), r1=43(y), r2=47(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 43
LDI r2, 47
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
