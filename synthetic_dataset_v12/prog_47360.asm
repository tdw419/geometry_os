; DESCRIPTION: Composite: Renders a purple line between points (425, 21) and (236, 23) then Places a cyan dot at position (494, 85).
; PLAN: r0=425(x1), r1=21(y1), r2=236(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=494(x), r6=85(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 425
LDI r1, 21
LDI r2, 236
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 85
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
