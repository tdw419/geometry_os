; DESCRIPTION: Renders a green box of size 17x82 starting at (52, 8).
; PLAN: r0=52(x), r1=8(y), r2=17(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 8
LDI r2, 17
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
