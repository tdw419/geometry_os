; DESCRIPTION: Renders a black box of size 63x82 starting at (160, 155).
; PLAN: r0=160(x), r1=155(y), r2=63(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 155
LDI r2, 63
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
