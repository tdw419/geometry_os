; DESCRIPTION: Renders a blue line between points (104, 245) and (381, 128).
; PLAN: r0=104(x1), r1=245(y1), r2=381(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 245
LDI r2, 381
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
