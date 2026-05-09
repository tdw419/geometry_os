; DESCRIPTION: Renders a purple line between points (126, 33) and (27, 250).
; PLAN: r0=126(x1), r1=33(y1), r2=27(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 33
LDI r2, 27
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
