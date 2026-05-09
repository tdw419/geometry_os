; DESCRIPTION: Draws a blue line from (320, 91) to (371, 8).
; PLAN: r0=320(x1), r1=91(y1), r2=371(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 91
LDI r2, 371
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
