; DESCRIPTION: Composite: Places a green circle of radius 73 at center (205, 79) then Places a green dot at position (237, 78).
; PLAN: r0=205(x), r1=79(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=78(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 79
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 78
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
