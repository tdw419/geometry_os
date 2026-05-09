; DESCRIPTION: Composite: Places a black dot at position (329, 233) then Renders a black disk with center (207, 170) and radius 58.
; PLAN: r0=329(x), r1=233(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=170(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 233
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 207
LDI r6, 170
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
