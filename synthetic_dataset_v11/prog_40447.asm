; DESCRIPTION: Renders a purple line between points (1, 108) and (235, 117).
; PLAN: r0=1(x1), r1=108(y1), r2=235(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 108
LDI r2, 235
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
