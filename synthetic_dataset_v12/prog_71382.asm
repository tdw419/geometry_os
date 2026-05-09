; DESCRIPTION: Renders a green box of size 105x25 starting at (195, 138).
; PLAN: r0=195(x), r1=138(y), r2=105(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 138
LDI r2, 105
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
