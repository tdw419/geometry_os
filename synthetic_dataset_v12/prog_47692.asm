; DESCRIPTION: Renders a magenta box of size 83x30 starting at (232, 116).
; PLAN: r0=232(x), r1=116(y), r2=83(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 116
LDI r2, 83
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
