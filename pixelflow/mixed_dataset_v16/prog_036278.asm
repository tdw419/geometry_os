; DESCRIPTION: Draws a blue line from (215, 241) to (280, 227).
; PLAN: r0=215(x1), r1=241(y1), r2=280(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 241
LDI r2, 280
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
