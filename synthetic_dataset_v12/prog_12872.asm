; DESCRIPTION: Renders a cyan disk with center (161, 81) and radius 54.
; PLAN: r0=161(x), r1=81(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 81
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
