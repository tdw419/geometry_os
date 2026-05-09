; DESCRIPTION: Draws a green line from (90, 38) to (227, 237).
; PLAN: r0=90(x1), r1=38(y1), r2=227(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 38
LDI r2, 227
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
