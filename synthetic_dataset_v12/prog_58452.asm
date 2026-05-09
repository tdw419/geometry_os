; DESCRIPTION: Composite: Draws a white circle centered at (367, 169) with radius 13 then Places a black dot at position (286, 46).
; PLAN: r0=367(x), r1=169(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=46(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 169
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 46
LDI r7, 0x000000
PSET r5, r6, r7
HALT
