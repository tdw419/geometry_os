; DESCRIPTION: Composite: Places a yellow circle of radius 32 at center (36, 79) then Places a red dot at position (32, 33).
; PLAN: r0=36(x), r1=79(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=33(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 36
LDI r1, 79
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 33
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
