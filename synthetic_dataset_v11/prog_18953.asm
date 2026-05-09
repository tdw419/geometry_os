; DESCRIPTION: Draws a green line from (7, 20) to (119, 237).
; PLAN: r0=7(x1), r1=20(y1), r2=119(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 20
LDI r2, 119
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
