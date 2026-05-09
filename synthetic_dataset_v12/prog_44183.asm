; DESCRIPTION: Composite: Renders a blue disk with center (51, 59) and radius 43 then Places a white dot at position (135, 6).
; PLAN: r0=51(x), r1=59(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=6(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 51
LDI r1, 59
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 6
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
