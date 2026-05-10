; DESCRIPTION: Renders a green rectangular region spanning 91 by 39 at (129, 140).
; PLAN: r0=129(x), r1=140(y), r2=91(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 140
LDI r2, 91
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
