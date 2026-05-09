; DESCRIPTION: Composite: Places a black dot at position (480, 154) then Places a green circle of radius 75 at center (395, 127).
; PLAN: r0=480(x), r1=154(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=127(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 480
LDI r1, 154
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 395
LDI r6, 127
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
