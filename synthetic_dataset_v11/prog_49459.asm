; DESCRIPTION: Composite: . Then Draws a white line from (236, 26) to (229, 201). Then Places a red dot at position (57, 245).
; PLAN: r0=236(x1), r1=26(y1), r2=229(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=57(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (236, 26) to (229, 201).
; PLAN: r0=236(x1), r1=26(y1), r2=229(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 26
LDI r2, 229
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (57, 245).
; PLAN: r0=57(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 245
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
