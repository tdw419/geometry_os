; DESCRIPTION: Places a blue line segment connecting (147, 120) to (320, 192).
; PLAN: r0=147(x1), r1=120(y1), r2=320(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 120
LDI r2, 320
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
