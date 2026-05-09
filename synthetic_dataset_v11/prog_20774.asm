; DESCRIPTION: Composite: . Then Draws a white line from (4, 95) to (154, 180). Then Places a white dot at position (90, 196).
; PLAN: r0=4(x1), r1=95(y1), r2=154(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=90(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (4, 95) to (154, 180).
; PLAN: r0=4(x1), r1=95(y1), r2=154(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 95
LDI r2, 154
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (90, 196).
; PLAN: r0=90(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 196
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
