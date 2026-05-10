; DESCRIPTION: Draws a blue line from (372, 115) to (241, 128).
; PLAN: r0=372(x1), r1=115(y1), r2=241(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 115
LDI r2, 241
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
