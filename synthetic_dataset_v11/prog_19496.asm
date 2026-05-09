; DESCRIPTION: Draws a blue line from (57, 115) to (202, 65).
; PLAN: r0=57(x1), r1=115(y1), r2=202(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 115
LDI r2, 202
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
