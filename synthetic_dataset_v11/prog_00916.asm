; DESCRIPTION: Composite: . Then Places a blue dot at position (44, 241). Then Draws a white line from (248, 76) to (95, 56).
; PLAN: r0=44(x), r1=241(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=248(x1), r1=76(y1), r2=95(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (44, 241).
; PLAN: r0=44(x), r1=241(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 241
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (248, 76) to (95, 56).
; PLAN: r0=248(x1), r1=76(y1), r2=95(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 76
LDI r2, 95
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
