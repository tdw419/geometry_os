; DESCRIPTION: Renders a green disk with center (303, 164) and radius 39.
; PLAN: r0=303(x), r1=164(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 164
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
