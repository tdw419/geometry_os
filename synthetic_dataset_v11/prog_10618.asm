; DESCRIPTION: Renders a green disk with center (70, 177) and radius 50.
; PLAN: r0=70(x), r1=177(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 177
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
