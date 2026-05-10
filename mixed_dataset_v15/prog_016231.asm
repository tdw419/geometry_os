; DESCRIPTION: Draws a blue line from (46, 185) to (320, 46).
; PLAN: r0=46(x1), r1=185(y1), r2=320(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 185
LDI r2, 320
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
