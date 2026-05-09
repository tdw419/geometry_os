; DESCRIPTION: Renders a purple box of size 43x59 starting at (126, 191).
; PLAN: r0=126(x), r1=191(y), r2=43(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 191
LDI r2, 43
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
