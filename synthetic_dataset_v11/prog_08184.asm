; DESCRIPTION: Renders a purple box of size 81x92 starting at (30, 13).
; PLAN: r0=30(x), r1=13(y), r2=81(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 13
LDI r2, 81
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
