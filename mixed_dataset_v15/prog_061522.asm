; DESCRIPTION: Composite: Draws a yellow circle centered at (98, 152) with radius 72 then Places a red dot at position (63, 152).
; PLAN: r0=98(x), r1=152(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=152(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 98
LDI r1, 152
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 152
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
