; DESCRIPTION: Composite: Draws a white line from (478, 169) to (198, 147) then Places a white dot at position (480, 167).
; PLAN: r0=478(x1), r1=169(y1), r2=198(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=167(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 478
LDI r1, 169
LDI r2, 198
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 167
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
