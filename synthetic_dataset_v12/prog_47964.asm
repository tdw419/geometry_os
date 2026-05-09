; DESCRIPTION: Renders a magenta box of size 10x92 starting at (397, 105).
; PLAN: r0=397(x), r1=105(y), r2=10(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 105
LDI r2, 10
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
