; DESCRIPTION: Renders a magenta box of size 51x46 starting at (115, 151).
; PLAN: r0=115(x), r1=151(y), r2=51(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 151
LDI r2, 51
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
