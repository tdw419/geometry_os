; DESCRIPTION: Renders a magenta box of size 17x45 starting at (184, 33).
; PLAN: r0=184(x), r1=33(y), r2=17(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 33
LDI r2, 17
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
