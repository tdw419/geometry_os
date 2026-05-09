; DESCRIPTION: Composite: . Then Places a white dot at position (106, 255). Then Draws a purple line from (6, 90) to (29, 117).
; PLAN: r0=106(x), r1=255(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=6(x1), r1=90(y1), r2=29(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (106, 255).
; PLAN: r0=106(x), r1=255(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 255
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (6, 90) to (29, 117).
; PLAN: r0=6(x1), r1=90(y1), r2=29(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 90
LDI r2, 29
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
