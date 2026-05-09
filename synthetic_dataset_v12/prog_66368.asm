; DESCRIPTION: Renders a magenta box of size 82x116 starting at (155, 34).
; PLAN: r0=155(x), r1=34(y), r2=82(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 34
LDI r2, 82
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
