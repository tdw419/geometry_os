; DESCRIPTION: Renders a purple box of size 90x27 starting at (65, 151).
; PLAN: r0=65(x), r1=151(y), r2=90(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 151
LDI r2, 90
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
