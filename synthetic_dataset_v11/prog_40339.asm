; DESCRIPTION: Renders a purple box of size 22x74 starting at (28, 116).
; PLAN: r0=28(x), r1=116(y), r2=22(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 116
LDI r2, 22
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
