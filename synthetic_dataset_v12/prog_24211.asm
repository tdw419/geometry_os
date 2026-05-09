; DESCRIPTION: Places a blue line segment connecting (320, 249) to (301, 150).
; PLAN: r0=320(x1), r1=249(y1), r2=301(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 249
LDI r2, 301
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
