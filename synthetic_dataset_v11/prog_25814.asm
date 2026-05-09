; DESCRIPTION: Renders a magenta box of size 37x33 starting at (157, 116).
; PLAN: r0=157(x), r1=116(y), r2=37(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 116
LDI r2, 37
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
