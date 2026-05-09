; DESCRIPTION: Composite: Creates a green circular shape at (337, 91) with radius 24 then Places a white dot at position (465, 250).
; PLAN: r0=337(x), r1=91(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x), r6=250(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 337
LDI r1, 91
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 250
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
