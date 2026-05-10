; DESCRIPTION: Composite: Places a white circle of radius 46 at center (374, 63) then Places a black dot at position (21, 108).
; PLAN: r0=374(x), r1=63(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x), r6=108(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 63
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 108
LDI r7, 0x000000
PSET r5, r6, r7
HALT
