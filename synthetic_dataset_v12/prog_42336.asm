; DESCRIPTION: Draws a blue line from (465, 115) to (411, 209).
; PLAN: r0=465(x1), r1=115(y1), r2=411(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 115
LDI r2, 411
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
