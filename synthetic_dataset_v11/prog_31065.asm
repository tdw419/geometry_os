; DESCRIPTION: Renders a purple box of size 105x82 starting at (30, 168).
; PLAN: r0=30(x), r1=168(y), r2=105(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 168
LDI r2, 105
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
