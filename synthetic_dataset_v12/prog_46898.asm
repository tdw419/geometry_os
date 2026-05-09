; DESCRIPTION: Draws a black line from (464, 144) to (179, 163).
; PLAN: r0=464(x1), r1=144(y1), r2=179(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 144
LDI r2, 179
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
