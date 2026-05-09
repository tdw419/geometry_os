; DESCRIPTION: Draws a blue line from (295, 200) to (180, 138).
; PLAN: r0=295(x1), r1=200(y1), r2=180(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 200
LDI r2, 180
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
