; DESCRIPTION: Renders a blue box of size 115x109 starting at (109, 82).
; PLAN: r0=109(x), r1=82(y), r2=115(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 82
LDI r2, 115
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
