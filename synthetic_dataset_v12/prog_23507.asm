; DESCRIPTION: Renders a purple line between points (340, 152) and (385, 176).
; PLAN: r0=340(x1), r1=152(y1), r2=385(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 152
LDI r2, 385
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
