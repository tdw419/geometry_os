; DESCRIPTION: Draws a green line from (0, 170) to (180, 230).
; PLAN: r0=0(x1), r1=170(y1), r2=180(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 170
LDI r2, 180
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
