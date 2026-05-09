; DESCRIPTION: Renders a black box of size 81x84 starting at (330, 86).
; PLAN: r0=330(x), r1=86(y), r2=81(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 86
LDI r2, 81
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
