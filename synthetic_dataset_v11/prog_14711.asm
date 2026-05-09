; DESCRIPTION: Renders a white box of size 22x36 starting at (159, 159).
; PLAN: r0=159(x), r1=159(y), r2=22(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 159
LDI r2, 22
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
