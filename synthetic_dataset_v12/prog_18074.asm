; DESCRIPTION: Renders a purple line between points (127, 79) and (269, 125).
; PLAN: r0=127(x1), r1=79(y1), r2=269(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 79
LDI r2, 269
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
