; DESCRIPTION: Composite: Renders a green line between points (80, 198) and (494, 216) then Places a magenta dot at position (266, 142).
; PLAN: r0=80(x1), r1=198(y1), r2=494(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=142(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 80
LDI r1, 198
LDI r2, 494
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 142
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
