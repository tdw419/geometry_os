; DESCRIPTION: Renders a black box of size 63x32 starting at (6, 119).
; PLAN: r0=6(x), r1=119(y), r2=63(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 119
LDI r2, 63
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
