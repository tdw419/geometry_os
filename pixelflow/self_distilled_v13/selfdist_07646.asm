; DESCRIPTION: Renders a green rectangular region spanning 48 by 19 at (233, 128).
; PLAN: r0=233(x), r1=128(y), r2=48(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 128
LDI r2, 48
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
