; DESCRIPTION: Renders a black box of size 98x20 starting at (159, 56).
; PLAN: r0=159(x), r1=56(y), r2=98(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 56
LDI r2, 98
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
