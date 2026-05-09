; DESCRIPTION: Renders a black box of size 16x14 starting at (350, 64).
; PLAN: r0=350(x), r1=64(y), r2=16(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 64
LDI r2, 16
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
