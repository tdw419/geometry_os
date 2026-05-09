; DESCRIPTION: Renders a purple line between points (75, 33) and (128, 52).
; PLAN: r0=75(x1), r1=33(y1), r2=128(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 33
LDI r2, 128
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
