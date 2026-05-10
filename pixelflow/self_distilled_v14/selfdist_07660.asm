; DESCRIPTION: Renders a green rectangular region spanning 31 by 71 at (230, 86).
; PLAN: r0=230(x), r1=86(y), r2=31(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 86
LDI r2, 31
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
