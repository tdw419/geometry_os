; DESCRIPTION: Composite: Draws a white circle centered at (178, 121) with radius 27 then Places a cyan dot at position (171, 238).
; PLAN: r0=178(x), r1=121(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=238(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 121
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 238
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
