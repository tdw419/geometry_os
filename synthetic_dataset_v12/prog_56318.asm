; DESCRIPTION: Draws a blue line from (302, 93) to (498, 202).
; PLAN: r0=302(x1), r1=93(y1), r2=498(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 93
LDI r2, 498
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
