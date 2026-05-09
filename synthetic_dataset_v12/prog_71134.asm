; DESCRIPTION: Composite: Renders a yellow line between points (437, 222) and (289, 146) then Places a cyan dot at position (146, 85).
; PLAN: r0=437(x1), r1=222(y1), r2=289(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=85(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 222
LDI r2, 289
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 85
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
