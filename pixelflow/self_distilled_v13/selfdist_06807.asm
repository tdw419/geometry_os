; DESCRIPTION: Draws a blue line from (311, 7) to (394, 94).
; PLAN: r0=311(x1), r1=7(y1), r2=394(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 7
LDI r2, 394
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
