; DESCRIPTION: Renders a magenta box of size 75x112 starting at (397, 133).
; PLAN: r0=397(x), r1=133(y), r2=75(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 133
LDI r2, 75
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
