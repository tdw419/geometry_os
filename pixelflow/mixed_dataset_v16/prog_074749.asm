; DESCRIPTION: Composite: Renders a green disk with center (403, 124) and radius 76 then Places a orange dot at position (215, 105).
; PLAN: r0=403(x), r1=124(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x), r6=105(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 124
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 105
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
