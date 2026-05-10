; DESCRIPTION: Draws a white line from (419, 150) to (9, 134).
; PLAN: r0=419(x1), r1=150(y1), r2=9(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 150
LDI r2, 9
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
