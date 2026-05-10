; DESCRIPTION: Renders a magenta rectangular region spanning 119 by 76 at (80, 50).
; PLAN: r0=80(x), r1=50(y), r2=119(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 50
LDI r2, 119
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
