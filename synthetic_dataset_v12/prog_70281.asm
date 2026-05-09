; DESCRIPTION: Renders a magenta box of size 76x21 starting at (81, 116).
; PLAN: r0=81(x), r1=116(y), r2=76(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 116
LDI r2, 76
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
