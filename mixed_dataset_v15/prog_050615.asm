; DESCRIPTION: Renders a purple box of size 105x93 starting at (121, 103).
; PLAN: r0=121(x), r1=103(y), r2=105(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 103
LDI r2, 105
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
