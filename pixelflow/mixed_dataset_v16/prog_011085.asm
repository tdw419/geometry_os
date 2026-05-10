; DESCRIPTION: Renders a blue rectangular region spanning 102 by 65 at (100, 192).
; PLAN: r0=100(x), r1=192(y), r2=102(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 192
LDI r2, 102
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
