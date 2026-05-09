; DESCRIPTION: Composite: . Then Draws a white line from (187, 91) to (170, 90). Then Sets a single red pixel at (136, 111).
; PLAN: r0=187(x1), r1=91(y1), r2=170(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=136(x), r1=111(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (187, 91) to (170, 90).
; PLAN: r0=187(x1), r1=91(y1), r2=170(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 91
LDI r2, 170
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (136, 111).
; PLAN: r0=136(x), r1=111(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 111
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
