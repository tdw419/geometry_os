; DESCRIPTION: Composite: . Then Places a cyan dot at position (143, 90). Then Places a red line segment connecting (211, 92) to (248, 1).
; PLAN: r0=143(x), r1=90(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=211(x1), r1=92(y1), r2=248(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (143, 90).
; PLAN: r0=143(x), r1=90(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 90
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (211, 92) to (248, 1).
; PLAN: r0=211(x1), r1=92(y1), r2=248(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 92
LDI r2, 248
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
