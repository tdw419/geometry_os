; DESCRIPTION: Composite: Draws a green circle centered at (238, 127) with radius 59 then Places a green dot at position (174, 255).
; PLAN: r0=238(x), r1=127(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=255(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 127
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 255
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
