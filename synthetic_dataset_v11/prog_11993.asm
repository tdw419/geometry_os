; DESCRIPTION: Renders a green disk with center (146, 73) and radius 25.
; PLAN: r0=146(x), r1=73(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 73
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
