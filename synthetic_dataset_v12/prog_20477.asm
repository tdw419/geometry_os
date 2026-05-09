; DESCRIPTION: Renders a magenta box of size 86x11 starting at (93, 194).
; PLAN: r0=93(x), r1=194(y), r2=86(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 194
LDI r2, 86
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
