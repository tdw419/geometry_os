; DESCRIPTION: Composite: Creates a blue circular shape at (387, 85) with radius 59 then Places a white dot at position (271, 229).
; PLAN: r0=387(x), r1=85(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x), r6=229(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 85
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 229
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
