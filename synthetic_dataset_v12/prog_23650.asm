; DESCRIPTION: Renders a purple box of size 64x96 starting at (96, 24).
; PLAN: r0=96(x), r1=24(y), r2=64(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 24
LDI r2, 64
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
