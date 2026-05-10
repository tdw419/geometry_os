; DESCRIPTION: Renders a purple box of size 88x90 starting at (424, 30).
; PLAN: r0=424(x), r1=30(y), r2=88(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 30
LDI r2, 88
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
