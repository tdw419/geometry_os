; DESCRIPTION: Renders a magenta box of size 45x115 starting at (266, 119).
; PLAN: r0=266(x), r1=119(y), r2=45(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 119
LDI r2, 45
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
