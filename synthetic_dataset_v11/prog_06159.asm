; DESCRIPTION: Draws a green line from (26, 171) to (110, 22).
; PLAN: r0=26(x1), r1=171(y1), r2=110(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 171
LDI r2, 110
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
