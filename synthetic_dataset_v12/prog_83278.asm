; DESCRIPTION: Composite: Places a magenta dot at position (189, 158) then Places a yellow circle of radius 70 at center (441, 169).
; PLAN: r0=189(x), r1=158(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=169(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 189
LDI r1, 158
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 169
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
