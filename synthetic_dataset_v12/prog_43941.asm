; DESCRIPTION: Renders a yellow box of size 60x52 starting at (51, 176).
; PLAN: r0=51(x), r1=176(y), r2=60(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 176
LDI r2, 60
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
