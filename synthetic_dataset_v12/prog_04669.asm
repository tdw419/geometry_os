; DESCRIPTION: Renders a magenta box of size 96x15 starting at (329, 53).
; PLAN: r0=329(x), r1=53(y), r2=96(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 53
LDI r2, 96
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
