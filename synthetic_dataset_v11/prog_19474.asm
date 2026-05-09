; DESCRIPTION: Composite: . Then Renders a cyan disk with center (90, 142) and radius 75. Then Places a black dot at position (92, 222).
; PLAN: r0=90(x), r1=142(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=92(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan disk with center (90, 142) and radius 75.
; PLAN: r0=90(x), r1=142(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 142
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (92, 222).
; PLAN: r0=92(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 222
LDI r2, 0x000000
PSET r0, r1, r2
HALT
