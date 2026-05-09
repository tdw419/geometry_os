; DESCRIPTION: Renders a yellow box of size 63x36 starting at (159, 176).
; PLAN: r0=159(x), r1=176(y), r2=63(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 176
LDI r2, 63
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
