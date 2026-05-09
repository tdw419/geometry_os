; DESCRIPTION: Composite: Places a magenta dot at position (95, 118) then Places a yellow circle of radius 66 at center (322, 103).
; PLAN: r0=95(x), r1=118(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=103(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 118
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 103
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
