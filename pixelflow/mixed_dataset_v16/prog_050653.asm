; DESCRIPTION: Renders a cyan disk with center (210, 147) and radius 68.
; PLAN: r0=210(x), r1=147(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 147
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
