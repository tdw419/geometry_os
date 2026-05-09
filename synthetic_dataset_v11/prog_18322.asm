; DESCRIPTION: Draws a green line from (255, 155) to (187, 96).
; PLAN: r0=255(x1), r1=155(y1), r2=187(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 155
LDI r2, 187
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
