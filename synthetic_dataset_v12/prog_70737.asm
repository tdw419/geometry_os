; DESCRIPTION: Renders a green line between points (195, 220) and (52, 141).
; PLAN: r0=195(x1), r1=220(y1), r2=52(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 220
LDI r2, 52
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
