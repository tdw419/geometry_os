; DESCRIPTION: Composite: Renders a magenta disk with center (480, 145) and radius 16 then Sets a single green pixel at (428, 171).
; PLAN: r0=480(x), r1=145(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=171(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 480
LDI r1, 145
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 171
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
