; DESCRIPTION: Renders a white line between points (195, 38) and (50, 51).
; PLAN: r0=195(x1), r1=38(y1), r2=50(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 38
LDI r2, 50
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
