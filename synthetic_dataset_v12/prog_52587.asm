; DESCRIPTION: Renders a white disk with center (362, 186) and radius 46.
; PLAN: r0=362(x), r1=186(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 186
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
