; DESCRIPTION: Renders a magenta box of size 15x43 starting at (97, 103).
; PLAN: r0=97(x), r1=103(y), r2=15(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 103
LDI r2, 15
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
