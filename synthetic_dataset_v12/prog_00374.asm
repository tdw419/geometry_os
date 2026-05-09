; DESCRIPTION: Renders a blue line between points (187, 64) and (331, 178).
; PLAN: r0=187(x1), r1=64(y1), r2=331(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 64
LDI r2, 331
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
