; DESCRIPTION: Composite: Places a white line segment connecting (305, 8) to (340, 232) then Places a blue dot at position (472, 118).
; PLAN: r0=305(x1), r1=8(y1), r2=340(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=118(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 8
LDI r2, 340
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 118
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
