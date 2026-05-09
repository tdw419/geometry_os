; DESCRIPTION: Draws a blue line from (215, 241) to (236, 7).
; PLAN: r0=215(x1), r1=241(y1), r2=236(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 241
LDI r2, 236
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
