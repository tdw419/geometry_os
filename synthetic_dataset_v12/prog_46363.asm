; DESCRIPTION: Renders a magenta box of size 76x100 starting at (385, 62).
; PLAN: r0=385(x), r1=62(y), r2=76(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 62
LDI r2, 76
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
