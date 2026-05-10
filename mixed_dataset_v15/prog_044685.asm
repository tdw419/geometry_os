; DESCRIPTION: Composite: Places a blue circle of radius 65 at center (333, 112) then Places a white dot at position (132, 161).
; PLAN: r0=333(x), r1=112(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=161(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 112
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 161
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
