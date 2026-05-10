; DESCRIPTION: Draws a blue line from (320, 62) to (128, 234).
; PLAN: r0=320(x1), r1=62(y1), r2=128(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 62
LDI r2, 128
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
