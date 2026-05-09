; DESCRIPTION: Renders a magenta box of size 72x20 starting at (62, 119).
; PLAN: r0=62(x), r1=119(y), r2=72(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 119
LDI r2, 72
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
