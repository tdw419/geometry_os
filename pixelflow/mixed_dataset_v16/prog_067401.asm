; DESCRIPTION: Composite: Draws a cyan line from (175, 184) to (136, 145) then Places a yellow dot at position (247, 200).
; PLAN: r0=175(x1), r1=184(y1), r2=136(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=200(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 184
LDI r2, 136
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 200
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
