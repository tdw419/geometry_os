; DESCRIPTION: Composite: Places a black dot at position (368, 100) then Renders a purple disk with center (101, 162) and radius 78.
; PLAN: r0=368(x), r1=100(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=101(x), r6=162(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 100
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 101
LDI r6, 162
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
