; DESCRIPTION: Draws a green line from (243, 188) to (418, 230).
; PLAN: r0=243(x1), r1=188(y1), r2=418(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 188
LDI r2, 418
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
