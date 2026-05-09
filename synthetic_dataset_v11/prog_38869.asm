; DESCRIPTION: Draws a green line from (240, 164) to (155, 94).
; PLAN: r0=240(x1), r1=164(y1), r2=155(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 164
LDI r2, 155
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
