; DESCRIPTION: Composite: Renders a red line between points (71, 45) and (137, 197) then Places a blue dot at position (64, 218).
; PLAN: r0=71(x1), r1=45(y1), r2=137(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=218(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 45
LDI r2, 137
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 218
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
