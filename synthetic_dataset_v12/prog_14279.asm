; DESCRIPTION: Renders a green line between points (87, 125) and (57, 51).
; PLAN: r0=87(x1), r1=125(y1), r2=57(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 125
LDI r2, 57
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
