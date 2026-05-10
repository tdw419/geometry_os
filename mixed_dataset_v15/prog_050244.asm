; DESCRIPTION: Draws a green line from (250, 240) to (256, 133).
; PLAN: r0=250(x1), r1=240(y1), r2=256(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 240
LDI r2, 256
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
