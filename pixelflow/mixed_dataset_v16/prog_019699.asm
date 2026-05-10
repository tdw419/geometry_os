; DESCRIPTION: Composite: Places a orange dot at position (272, 2) then Places a white circle of radius 16 at center (215, 163).
; PLAN: r0=272(x), r1=2(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=163(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 272
LDI r1, 2
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 215
LDI r6, 163
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
