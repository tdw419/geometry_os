; DESCRIPTION: Renders a magenta box of size 62x12 starting at (364, 218).
; PLAN: r0=364(x), r1=218(y), r2=62(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 218
LDI r2, 62
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
