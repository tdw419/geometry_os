; DESCRIPTION: Renders a purple box of size 26x65 starting at (285, 11).
; PLAN: r0=285(x), r1=11(y), r2=26(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 11
LDI r2, 26
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
