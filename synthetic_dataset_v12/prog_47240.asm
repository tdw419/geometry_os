; DESCRIPTION: Composite: Places a blue circle of radius 46 at center (350, 200) then Places a purple dot at position (309, 47).
; PLAN: r0=350(x), r1=200(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=47(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 200
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 47
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
