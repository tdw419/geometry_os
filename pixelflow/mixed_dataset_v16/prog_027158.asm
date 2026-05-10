; DESCRIPTION: Renders a green rectangular region spanning 71 by 50 at (377, 194).
; PLAN: r0=377(x), r1=194(y), r2=71(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 194
LDI r2, 71
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
