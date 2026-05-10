; DESCRIPTION: Renders a green rectangular region spanning 94 by 27 at (326, 17).
; PLAN: r0=326(x), r1=17(y), r2=94(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 17
LDI r2, 94
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
