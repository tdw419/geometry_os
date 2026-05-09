; DESCRIPTION: Renders a magenta box of size 43x94 starting at (184, 40).
; PLAN: r0=184(x), r1=40(y), r2=43(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 40
LDI r2, 43
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
