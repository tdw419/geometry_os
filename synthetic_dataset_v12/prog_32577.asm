; DESCRIPTION: Renders a magenta box of size 14x55 starting at (397, 149).
; PLAN: r0=397(x), r1=149(y), r2=14(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 149
LDI r2, 14
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
