; DESCRIPTION: Renders a purple box of size 111x98 starting at (26, 15).
; PLAN: r0=26(x), r1=15(y), r2=111(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 15
LDI r2, 111
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
