; DESCRIPTION: Draws a green line from (385, 186) to (37, 22).
; PLAN: r0=385(x1), r1=186(y1), r2=37(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 186
LDI r2, 37
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
