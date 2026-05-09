; DESCRIPTION: Renders a purple box of size 79x103 starting at (121, 151).
; PLAN: r0=121(x), r1=151(y), r2=79(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 151
LDI r2, 79
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
