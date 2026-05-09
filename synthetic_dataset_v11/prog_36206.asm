; DESCRIPTION: Composite: . Then Draws a white line from (225, 192) to (174, 142). Then Sets a single red pixel at (1, 143).
; PLAN: r0=225(x1), r1=192(y1), r2=174(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=1(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (225, 192) to (174, 142).
; PLAN: r0=225(x1), r1=192(y1), r2=174(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 192
LDI r2, 174
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (1, 143).
; PLAN: r0=1(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 143
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
