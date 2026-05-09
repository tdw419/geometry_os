; DESCRIPTION: Renders a black box of size 86x85 starting at (282, 40).
; PLAN: r0=282(x), r1=40(y), r2=86(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 40
LDI r2, 86
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
