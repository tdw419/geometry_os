; DESCRIPTION: Composite: . Then Draws a blue line from (186, 109) to (106, 202). Then Places a white dot at position (156, 180).
; PLAN: r0=186(x1), r1=109(y1), r2=106(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=156(x), r1=180(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (186, 109) to (106, 202).
; PLAN: r0=186(x1), r1=109(y1), r2=106(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 109
LDI r2, 106
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (156, 180).
; PLAN: r0=156(x), r1=180(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 180
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
