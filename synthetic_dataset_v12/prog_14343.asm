; DESCRIPTION: Draws a blue line from (289, 53) to (48, 46).
; PLAN: r0=289(x1), r1=53(y1), r2=48(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 53
LDI r2, 48
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
