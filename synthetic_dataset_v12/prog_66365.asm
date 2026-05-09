; DESCRIPTION: Renders a purple box of size 22x15 starting at (86, 235).
; PLAN: r0=86(x), r1=235(y), r2=22(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 235
LDI r2, 22
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
