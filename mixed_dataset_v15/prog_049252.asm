; DESCRIPTION: Renders a green disk with center (186, 172) and radius 60.
; PLAN: r0=186(x), r1=172(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 172
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
