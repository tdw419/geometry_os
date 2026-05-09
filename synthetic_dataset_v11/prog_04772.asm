; DESCRIPTION: Renders a purple box of size 97x30 starting at (92, 26).
; PLAN: r0=92(x), r1=26(y), r2=97(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 26
LDI r2, 97
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
