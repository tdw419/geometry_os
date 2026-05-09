; DESCRIPTION: Composite: Sets a single magenta pixel at (33, 180) then Places a green circle of radius 64 at center (445, 165).
; PLAN: r0=33(x), r1=180(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=445(x), r6=165(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 33
LDI r1, 180
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 445
LDI r6, 165
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
