; DESCRIPTION: Composite: Places a green circle of radius 64 at center (408, 180) then Sets a single magenta pixel at (237, 164).
; PLAN: r0=408(x), r1=180(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=164(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 180
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 164
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
