; DESCRIPTION: Composite: Renders a white line between points (482, 85) and (107, 75) then Places a blue dot at position (230, 161).
; PLAN: r0=482(x1), r1=85(y1), r2=107(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=161(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 482
LDI r1, 85
LDI r2, 107
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 161
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
