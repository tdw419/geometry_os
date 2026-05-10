; DESCRIPTION: Renders a black box of size 87x109 starting at (310, 79).
; PLAN: r0=310(x), r1=79(y), r2=87(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 79
LDI r2, 87
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
