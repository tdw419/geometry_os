; DESCRIPTION: Renders a purple line between points (150, 174) and (334, 125).
; PLAN: r0=150(x1), r1=174(y1), r2=334(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 174
LDI r2, 334
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
