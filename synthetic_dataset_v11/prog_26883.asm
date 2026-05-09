; DESCRIPTION: Composite: . Then Places a cyan dot at position (111, 130). Then Renders a red line between points (104, 238) and (156, 128).
; PLAN: r0=111(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=104(x1), r1=238(y1), r2=156(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (111, 130).
; PLAN: r0=111(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (104, 238) and (156, 128).
; PLAN: r0=104(x1), r1=238(y1), r2=156(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 238
LDI r2, 156
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
