; DESCRIPTION: Renders a purple box of size 29x83 starting at (23, 56).
; PLAN: r0=23(x), r1=56(y), r2=29(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 56
LDI r2, 29
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
