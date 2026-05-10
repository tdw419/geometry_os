; DESCRIPTION: Draws a blue line from (222, 251) to (289, 215).
; PLAN: r0=222(x1), r1=251(y1), r2=289(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 251
LDI r2, 289
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
