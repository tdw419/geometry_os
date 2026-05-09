; DESCRIPTION: Renders a green box of size 29x97 starting at (107, 112).
; PLAN: r0=107(x), r1=112(y), r2=29(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 112
LDI r2, 29
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
