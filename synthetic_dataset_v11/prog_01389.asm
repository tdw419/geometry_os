; DESCRIPTION: Renders a purple box of size 51x65 starting at (26, 82).
; PLAN: r0=26(x), r1=82(y), r2=51(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 82
LDI r2, 51
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
