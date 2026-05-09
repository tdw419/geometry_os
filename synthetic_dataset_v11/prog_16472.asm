; DESCRIPTION: Renders a purple line between points (97, 111) and (173, 132).
; PLAN: r0=97(x1), r1=111(y1), r2=173(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 111
LDI r2, 173
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
