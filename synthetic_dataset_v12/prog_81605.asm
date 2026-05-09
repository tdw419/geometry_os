; DESCRIPTION: Renders a magenta box of size 12x11 starting at (341, 17).
; PLAN: r0=341(x), r1=17(y), r2=12(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 17
LDI r2, 12
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
