; DESCRIPTION: Renders a purple box of size 19x67 starting at (236, 116).
; PLAN: r0=236(x), r1=116(y), r2=19(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 116
LDI r2, 19
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
