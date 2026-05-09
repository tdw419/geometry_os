; DESCRIPTION: Composite: Places a white circle of radius 38 at center (72, 163) then Sets a single magenta pixel at (137, 213).
; PLAN: r0=72(x), r1=163(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x), r6=213(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 163
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 213
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
