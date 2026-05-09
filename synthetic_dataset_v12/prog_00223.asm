; DESCRIPTION: Renders a purple box of size 26x42 starting at (407, 43).
; PLAN: r0=407(x), r1=43(y), r2=26(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 43
LDI r2, 26
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
