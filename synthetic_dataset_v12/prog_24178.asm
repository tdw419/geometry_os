; DESCRIPTION: Composite: Draws a black circle centered at (330, 59) with radius 16 then Places a yellow dot at position (71, 209).
; PLAN: r0=330(x), r1=59(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=209(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 59
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 209
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
