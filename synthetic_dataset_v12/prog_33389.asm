; DESCRIPTION: Draws a blue line from (281, 12) to (505, 226).
; PLAN: r0=281(x1), r1=12(y1), r2=505(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 12
LDI r2, 505
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
