; DESCRIPTION: Renders a black box of size 103x26 starting at (5, 128).
; PLAN: r0=5(x), r1=128(y), r2=103(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 128
LDI r2, 103
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
