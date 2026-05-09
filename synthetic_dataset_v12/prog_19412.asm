; DESCRIPTION: Draws a blue line from (349, 14) to (298, 205).
; PLAN: r0=349(x1), r1=14(y1), r2=298(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 14
LDI r2, 298
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
