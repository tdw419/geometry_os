; DESCRIPTION: Renders a magenta box of size 93x116 starting at (122, 116).
; PLAN: r0=122(x), r1=116(y), r2=93(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 116
LDI r2, 93
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
