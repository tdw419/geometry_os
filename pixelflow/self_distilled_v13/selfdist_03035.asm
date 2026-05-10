; DESCRIPTION: Renders a blue rectangular region spanning 44 by 82 at (17, 192).
; PLAN: r0=17(x), r1=192(y), r2=44(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 192
LDI r2, 44
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
