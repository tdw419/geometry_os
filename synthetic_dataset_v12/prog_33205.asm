; DESCRIPTION: Renders a green box of size 51x85 starting at (208, 163).
; PLAN: r0=208(x), r1=163(y), r2=51(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 163
LDI r2, 51
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
