; DESCRIPTION: Draws a green line from (331, 169) to (215, 28).
; PLAN: r0=331(x1), r1=169(y1), r2=215(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 169
LDI r2, 215
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
