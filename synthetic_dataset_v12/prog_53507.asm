; DESCRIPTION: Renders a purple box of size 83x48 starting at (261, 64).
; PLAN: r0=261(x), r1=64(y), r2=83(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 64
LDI r2, 83
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
