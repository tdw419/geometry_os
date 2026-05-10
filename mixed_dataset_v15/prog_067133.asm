; DESCRIPTION: Composite: Places a blue dot at position (402, 229) then Places a blue circle of radius 79 at center (283, 119).
; PLAN: r0=402(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=119(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 229
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 119
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
