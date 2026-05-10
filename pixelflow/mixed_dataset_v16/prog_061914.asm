; DESCRIPTION: Renders a blue line between points (351, 128) and (164, 46).
; PLAN: r0=351(x1), r1=128(y1), r2=164(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 128
LDI r2, 164
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
