; DESCRIPTION: Composite: Places a white dot at position (110, 92) then Renders a blue disk with center (222, 150) and radius 26.
; PLAN: r0=110(x), r1=92(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=150(y), r7=26(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 92
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 222
LDI r6, 150
LDI r7, 26
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
