; DESCRIPTION: Renders a magenta box of size 40x119 starting at (139, 14).
; PLAN: r0=139(x), r1=14(y), r2=40(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 14
LDI r2, 40
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
