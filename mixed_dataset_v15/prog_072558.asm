; DESCRIPTION: Renders a blue rectangular region spanning 32 by 44 at (334, 17).
; PLAN: r0=334(x), r1=17(y), r2=32(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 17
LDI r2, 32
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
