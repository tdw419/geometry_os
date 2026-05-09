; DESCRIPTION: Composite: . Then Draws a red line from (179, 32) to (89, 150). Then Places a white dot at position (240, 191).
; PLAN: r0=179(x1), r1=32(y1), r2=89(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=240(x), r1=191(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (179, 32) to (89, 150).
; PLAN: r0=179(x1), r1=32(y1), r2=89(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 32
LDI r2, 89
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (240, 191).
; PLAN: r0=240(x), r1=191(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 191
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
