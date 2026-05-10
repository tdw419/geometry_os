; DESCRIPTION: Renders a green disk with center (146, 115) and radius 20.
; PLAN: r0=146(x), r1=115(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 115
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
