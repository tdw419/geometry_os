; DESCRIPTION: Renders a magenta box of size 105x19 starting at (53, 9).
; PLAN: r0=53(x), r1=9(y), r2=105(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 9
LDI r2, 105
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
