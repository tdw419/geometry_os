; DESCRIPTION: Renders a red line between points (330, 31) and (293, 62).
; PLAN: r0=330(x1), r1=31(y1), r2=293(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 31
LDI r2, 293
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
