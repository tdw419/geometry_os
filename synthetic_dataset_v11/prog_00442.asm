; DESCRIPTION: Draws a blue line from (128, 193) to (85, 44).
; PLAN: r0=128(x1), r1=193(y1), r2=85(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 193
LDI r2, 85
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
