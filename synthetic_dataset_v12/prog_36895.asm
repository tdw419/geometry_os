; DESCRIPTION: Renders a magenta box of size 116x49 starting at (35, 64).
; PLAN: r0=35(x), r1=64(y), r2=116(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 64
LDI r2, 116
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
