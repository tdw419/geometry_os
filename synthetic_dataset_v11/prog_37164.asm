; DESCRIPTION: Composite: . Then Places a cyan dot at position (57, 195). Then Draws a red line from (165, 182) to (159, 23).
; PLAN: r0=57(x), r1=195(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=165(x1), r1=182(y1), r2=159(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (57, 195).
; PLAN: r0=57(x), r1=195(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 195
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (165, 182) to (159, 23).
; PLAN: r0=165(x1), r1=182(y1), r2=159(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 182
LDI r2, 159
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
