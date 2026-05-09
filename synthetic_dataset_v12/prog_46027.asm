; DESCRIPTION: Composite: Renders a cyan line between points (37, 66) and (128, 89) then Places a blue dot at position (414, 135).
; PLAN: r0=37(x1), r1=66(y1), r2=128(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=135(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 37
LDI r1, 66
LDI r2, 128
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 135
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
