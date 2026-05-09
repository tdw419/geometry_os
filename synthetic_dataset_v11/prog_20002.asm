; DESCRIPTION: Composite: . Then Places a white dot at position (105, 22). Then Renders a red line between points (87, 118) and (151, 150).
; PLAN: r0=105(x), r1=22(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=87(x1), r1=118(y1), r2=151(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (105, 22).
; PLAN: r0=105(x), r1=22(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 22
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (87, 118) and (151, 150).
; PLAN: r0=87(x1), r1=118(y1), r2=151(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 118
LDI r2, 151
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
