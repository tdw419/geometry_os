; DESCRIPTION: Renders a magenta box of size 111x54 starting at (336, 116).
; PLAN: r0=336(x), r1=116(y), r2=111(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 116
LDI r2, 111
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
