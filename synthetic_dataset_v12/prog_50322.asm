; DESCRIPTION: Renders a purple box of size 93x57 starting at (408, 151).
; PLAN: r0=408(x), r1=151(y), r2=93(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 151
LDI r2, 93
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
