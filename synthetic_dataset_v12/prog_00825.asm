; DESCRIPTION: Renders a magenta box of size 96x82 starting at (233, 56).
; PLAN: r0=233(x), r1=56(y), r2=96(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 56
LDI r2, 96
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
