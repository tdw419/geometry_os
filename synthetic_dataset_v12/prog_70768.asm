; DESCRIPTION: Renders a purple line between points (173, 127) and (125, 172).
; PLAN: r0=173(x1), r1=127(y1), r2=125(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 127
LDI r2, 125
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
