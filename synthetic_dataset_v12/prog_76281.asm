; DESCRIPTION: Renders a black box of size 64x11 starting at (256, 183).
; PLAN: r0=256(x), r1=183(y), r2=64(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 183
LDI r2, 64
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
