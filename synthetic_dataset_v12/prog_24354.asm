; DESCRIPTION: Renders a red line between points (293, 32) and (2, 97).
; PLAN: r0=293(x1), r1=32(y1), r2=2(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 32
LDI r2, 2
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
