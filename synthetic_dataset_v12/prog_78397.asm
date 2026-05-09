; DESCRIPTION: Draws a yellow line from (397, 84) to (371, 98).
; PLAN: r0=397(x1), r1=84(y1), r2=371(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 84
LDI r2, 371
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
