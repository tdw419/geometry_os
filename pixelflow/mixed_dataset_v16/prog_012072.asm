; DESCRIPTION: Renders a green disk with center (327, 146) and radius 14.
; PLAN: r0=327(x), r1=146(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 146
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
