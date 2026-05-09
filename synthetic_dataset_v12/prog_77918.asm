; DESCRIPTION: Draws a blue line from (197, 209) to (457, 14).
; PLAN: r0=197(x1), r1=209(y1), r2=457(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 209
LDI r2, 457
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
