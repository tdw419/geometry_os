; DESCRIPTION: Renders a green line between points (27, 51) and (252, 233).
; PLAN: r0=27(x1), r1=51(y1), r2=252(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 51
LDI r2, 252
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
