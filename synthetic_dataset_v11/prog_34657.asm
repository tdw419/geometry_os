; DESCRIPTION: Renders a purple box of size 11x67 starting at (206, 19).
; PLAN: r0=206(x), r1=19(y), r2=11(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 19
LDI r2, 11
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
