; DESCRIPTION: Renders a purple box of size 64x105 starting at (156, 39).
; PLAN: r0=156(x), r1=39(y), r2=64(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 39
LDI r2, 64
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
