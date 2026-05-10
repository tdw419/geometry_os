; DESCRIPTION: Composite: Renders a purple line between points (165, 68) and (230, 69) then Places a red dot at position (257, 23).
; PLAN: r0=165(x1), r1=68(y1), r2=230(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=23(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 68
LDI r2, 230
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 23
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
