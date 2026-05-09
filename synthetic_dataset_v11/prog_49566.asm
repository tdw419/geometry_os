; DESCRIPTION: Renders a yellow box of size 60x115 starting at (87, 136).
; PLAN: r0=87(x), r1=136(y), r2=60(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 136
LDI r2, 60
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
