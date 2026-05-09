; DESCRIPTION: Composite: Draws a green circle centered at (151, 200) with radius 26 then Places a green dot at position (152, 47).
; PLAN: r0=151(x), r1=200(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=47(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 200
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 47
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
