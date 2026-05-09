; DESCRIPTION: Renders a cyan disk with center (81, 133) and radius 44.
; PLAN: r0=81(x), r1=133(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 133
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
