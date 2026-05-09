; DESCRIPTION: Renders a purple box of size 105x103 starting at (96, 82).
; PLAN: r0=96(x), r1=82(y), r2=105(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 82
LDI r2, 105
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
