; DESCRIPTION: Renders a blue disk with center (465, 190) and radius 47.
; PLAN: r0=465(x), r1=190(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 190
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
