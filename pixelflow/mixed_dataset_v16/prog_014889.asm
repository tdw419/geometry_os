; DESCRIPTION: Renders a purple box of size 73x96 starting at (289, 26).
; PLAN: r0=289(x), r1=26(y), r2=73(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 26
LDI r2, 73
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
