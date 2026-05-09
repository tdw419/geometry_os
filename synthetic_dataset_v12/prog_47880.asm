; DESCRIPTION: Draws a green circle centered at (187, 71) with radius 30.
; PLAN: r0=187(x), r1=71(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 71
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
