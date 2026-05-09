; DESCRIPTION: Renders a green line between points (125, 51) and (146, 33).
; PLAN: r0=125(x1), r1=51(y1), r2=146(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 51
LDI r2, 146
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
