; DESCRIPTION: Composite: Renders a magenta disk with center (119, 187) and radius 55 then Places a red dot at position (252, 80).
; PLAN: r0=119(x), r1=187(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=80(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 119
LDI r1, 187
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 80
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
