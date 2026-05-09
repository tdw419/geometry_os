; DESCRIPTION: Composite: Renders a cyan line between points (285, 127) and (489, 231) then Places a purple dot at position (207, 51).
; PLAN: r0=285(x1), r1=127(y1), r2=489(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=51(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 127
LDI r2, 489
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 51
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
