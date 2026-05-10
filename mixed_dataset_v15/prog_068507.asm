; DESCRIPTION: Composite: Places a cyan dot at position (443, 154) then Renders a purple line between points (259, 245) and (439, 240).
; PLAN: r0=443(x), r1=154(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=259(x1), r6=245(y1), r7=439(x2), r8=240(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 154
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 245
LDI r7, 439
LDI r8, 240
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
