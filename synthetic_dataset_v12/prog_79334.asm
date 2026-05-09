; DESCRIPTION: Renders a magenta box of size 43x108 starting at (18, 129).
; PLAN: r0=18(x), r1=129(y), r2=43(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 129
LDI r2, 43
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
