; DESCRIPTION: Renders a black box of size 40x82 starting at (132, 128).
; PLAN: r0=132(x), r1=128(y), r2=40(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 128
LDI r2, 40
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
