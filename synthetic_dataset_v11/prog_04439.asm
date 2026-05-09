; DESCRIPTION: Renders a black box of size 76x64 starting at (30, 136).
; PLAN: r0=30(x), r1=136(y), r2=76(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 136
LDI r2, 76
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
