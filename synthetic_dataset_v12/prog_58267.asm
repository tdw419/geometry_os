; DESCRIPTION: Renders a magenta box of size 83x107 starting at (341, 45).
; PLAN: r0=341(x), r1=45(y), r2=83(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 45
LDI r2, 83
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
