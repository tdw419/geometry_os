; DESCRIPTION: Composite: Places a cyan dot at position (496, 209) then Renders a purple line between points (166, 177) and (231, 156).
; PLAN: r0=496(x), r1=209(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=166(x1), r6=177(y1), r7=231(x2), r8=156(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 496
LDI r1, 209
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 177
LDI r7, 231
LDI r8, 156
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
