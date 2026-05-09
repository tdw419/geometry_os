; DESCRIPTION: Renders a white line between points (293, 3) and (367, 140).
; PLAN: r0=293(x1), r1=3(y1), r2=367(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 3
LDI r2, 367
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
