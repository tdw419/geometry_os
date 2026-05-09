; DESCRIPTION: Renders a purple line between points (173, 209) and (60, 127).
; PLAN: r0=173(x1), r1=209(y1), r2=60(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 209
LDI r2, 60
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
