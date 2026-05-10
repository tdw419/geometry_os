; DESCRIPTION: Renders a magenta box of size 19x51 starting at (28, 198).
; PLAN: r0=28(x), r1=198(y), r2=19(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 198
LDI r2, 19
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
