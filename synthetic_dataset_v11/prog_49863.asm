; DESCRIPTION: Renders a purple line between points (172, 157) and (180, 125).
; PLAN: r0=172(x1), r1=157(y1), r2=180(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 157
LDI r2, 180
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
