; DESCRIPTION: Renders a purple box of size 115x15 starting at (130, 28).
; PLAN: r0=130(x), r1=28(y), r2=115(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 28
LDI r2, 115
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
