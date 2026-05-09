; DESCRIPTION: Draws a blue line from (295, 237) to (110, 160).
; PLAN: r0=295(x1), r1=237(y1), r2=110(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 237
LDI r2, 110
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
