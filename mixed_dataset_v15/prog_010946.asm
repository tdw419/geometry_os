; DESCRIPTION: Renders a green disk with center (465, 98) and radius 44.
; PLAN: r0=465(x), r1=98(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 98
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
