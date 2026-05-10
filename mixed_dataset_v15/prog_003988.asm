; DESCRIPTION: Draws a blue line from (73, 249) to (98, 161).
; PLAN: r0=73(x1), r1=249(y1), r2=98(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 249
LDI r2, 98
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
