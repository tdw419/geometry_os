; DESCRIPTION: Renders a red disk with center (110, 197) and radius 15.
; PLAN: r0=110(x), r1=197(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 197
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
