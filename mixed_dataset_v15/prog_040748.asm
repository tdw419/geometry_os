; DESCRIPTION: Renders a purple box of size 44x96 starting at (62, 156).
; PLAN: r0=62(x), r1=156(y), r2=44(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 156
LDI r2, 44
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
