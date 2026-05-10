; DESCRIPTION: Places a blue disk with center (268, 165) and radius 46.
; PLAN: r0=268(x), r1=165(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 165
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
