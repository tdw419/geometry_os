; DESCRIPTION: Renders a magenta box of size 43x119 starting at (230, 68).
; PLAN: r0=230(x), r1=68(y), r2=43(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 68
LDI r2, 43
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
