; DESCRIPTION: Composite: Renders a black line between points (185, 152) and (77, 251) then Places a yellow dot at position (253, 135).
; PLAN: r0=185(x1), r1=152(y1), r2=77(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=135(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 152
LDI r2, 77
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 135
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
