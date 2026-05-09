; DESCRIPTION: Renders a cyan disk with center (323, 196) and radius 54.
; PLAN: r0=323(x), r1=196(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 196
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
