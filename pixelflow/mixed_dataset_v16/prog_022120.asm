; DESCRIPTION: Composite: Draws a purple circle centered at (428, 242) with radius 10 then Sets a single black pixel at (480, 25).
; PLAN: r0=428(x), r1=242(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x), r6=25(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 428
LDI r1, 242
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 25
LDI r7, 0x000000
PSET r5, r6, r7
HALT
