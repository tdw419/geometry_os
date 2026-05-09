; DESCRIPTION: Renders a black box of size 112x21 starting at (335, 211).
; PLAN: r0=335(x), r1=211(y), r2=112(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 211
LDI r2, 112
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
