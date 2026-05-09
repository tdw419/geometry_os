; DESCRIPTION: Composite: Places a blue dot at position (403, 25) then Draws a purple circle centered at (38, 138) with radius 12.
; PLAN: r0=403(x), r1=25(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=38(x), r6=138(y), r7=12(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 25
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 38
LDI r6, 138
LDI r7, 12
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
