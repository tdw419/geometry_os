; DESCRIPTION: Composite: Places a blue circle of radius 71 at center (221, 143) then Places a magenta dot at position (110, 218).
; PLAN: r0=221(x), r1=143(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=110(x), r6=218(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 221
LDI r1, 143
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 110
LDI r6, 218
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
