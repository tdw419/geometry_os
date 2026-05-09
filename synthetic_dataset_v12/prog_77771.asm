; DESCRIPTION: Renders a green box of size 60x51 starting at (100, 103).
; PLAN: r0=100(x), r1=103(y), r2=60(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 103
LDI r2, 60
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
