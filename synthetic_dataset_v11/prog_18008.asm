; DESCRIPTION: Renders a magenta box of size 18x19 starting at (35, 235).
; PLAN: r0=35(x), r1=235(y), r2=18(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 235
LDI r2, 18
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
