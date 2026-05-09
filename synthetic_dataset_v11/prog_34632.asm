; DESCRIPTION: Renders a magenta box of size 21x105 starting at (192, 43).
; PLAN: r0=192(x), r1=43(y), r2=21(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 43
LDI r2, 21
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
