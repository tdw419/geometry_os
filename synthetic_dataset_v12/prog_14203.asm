; DESCRIPTION: Draws a blue line from (180, 199) to (504, 10).
; PLAN: r0=180(x1), r1=199(y1), r2=504(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 199
LDI r2, 504
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
