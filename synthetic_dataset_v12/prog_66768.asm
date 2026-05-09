; DESCRIPTION: Draws a blue line from (190, 132) to (320, 137).
; PLAN: r0=190(x1), r1=132(y1), r2=320(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 132
LDI r2, 320
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
