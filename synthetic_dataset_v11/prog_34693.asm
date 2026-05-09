; DESCRIPTION: Composite: . Then Renders a green line between points (15, 0) and (144, 126). Then Sets a single orange pixel at (236, 111).
; PLAN: r0=15(x1), r1=0(y1), r2=144(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=236(x), r1=111(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (15, 0) and (144, 126).
; PLAN: r0=15(x1), r1=0(y1), r2=144(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 0
LDI r2, 144
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (236, 111).
; PLAN: r0=236(x), r1=111(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 111
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
