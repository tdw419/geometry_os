; DESCRIPTION: Composite: Places a cyan line segment connecting (95, 229) to (454, 143) then Places a cyan dot at position (511, 86).
; PLAN: r0=95(x1), r1=229(y1), r2=454(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=86(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 229
LDI r2, 454
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 86
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
