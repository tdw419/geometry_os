; DESCRIPTION: Composite: . Then Draws a red line from (60, 113) to (31, 136). Then Places a white dot at position (131, 212).
; PLAN: r0=60(x1), r1=113(y1), r2=31(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=131(x), r1=212(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (60, 113) to (31, 136).
; PLAN: r0=60(x1), r1=113(y1), r2=31(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 113
LDI r2, 31
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (131, 212).
; PLAN: r0=131(x), r1=212(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 212
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
