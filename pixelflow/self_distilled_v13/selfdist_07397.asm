; DESCRIPTION: Renders a green rectangular region spanning 71 by 25 at (176, 148).
; PLAN: r0=176(x), r1=148(y), r2=71(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 148
LDI r2, 71
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
