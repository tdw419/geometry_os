; DESCRIPTION: Renders a magenta box of size 62x44 starting at (138, 116).
; PLAN: r0=138(x), r1=116(y), r2=62(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 116
LDI r2, 62
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
