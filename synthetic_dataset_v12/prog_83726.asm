; DESCRIPTION: Renders a green box of size 90x108 starting at (159, 125).
; PLAN: r0=159(x), r1=125(y), r2=90(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 125
LDI r2, 90
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
