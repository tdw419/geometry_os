; DESCRIPTION: Renders a white line between points (508, 63) and (25, 177).
; PLAN: r0=508(x1), r1=63(y1), r2=25(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 63
LDI r2, 25
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
