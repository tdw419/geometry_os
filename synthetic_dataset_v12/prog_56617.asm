; DESCRIPTION: Composite: Draws a cyan circle centered at (231, 145) with radius 32 then Sets a single purple pixel at (416, 82).
; PLAN: r0=231(x), r1=145(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=82(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 231
LDI r1, 145
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 82
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
