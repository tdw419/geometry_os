; DESCRIPTION: Renders a yellow line between points (292, 220) and (52, 132).
; PLAN: r0=292(x1), r1=220(y1), r2=52(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 220
LDI r2, 52
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
