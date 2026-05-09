; DESCRIPTION: Draws a blue line from (372, 63) to (251, 50).
; PLAN: r0=372(x1), r1=63(y1), r2=251(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 63
LDI r2, 251
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
