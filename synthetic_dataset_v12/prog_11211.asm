; DESCRIPTION: Composite: Sets a single magenta pixel at (305, 94) then Places a red 112x118 rectangle at position (390, 51).
; PLAN: r0=305(x), r1=94(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=390(x), r6=51(y), r7=112(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 94
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 390
LDI r6, 51
LDI r7, 112
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
