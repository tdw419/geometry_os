; DESCRIPTION: Draws a purple line from (281, 20) to (446, 51).
; PLAN: r0=281(x1), r1=20(y1), r2=446(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 20
LDI r2, 446
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
