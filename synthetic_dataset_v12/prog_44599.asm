; DESCRIPTION: Renders a magenta box of size 53x15 starting at (20, 18).
; PLAN: r0=20(x), r1=18(y), r2=53(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 18
LDI r2, 53
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
