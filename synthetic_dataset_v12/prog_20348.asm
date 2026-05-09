; DESCRIPTION: Composite: Draws a white line from (141, 35) to (163, 63) then Places a blue dot at position (433, 36).
; PLAN: r0=141(x1), r1=35(y1), r2=163(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=36(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 35
LDI r2, 163
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 36
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
