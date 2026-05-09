; DESCRIPTION: Places a blue line segment connecting (180, 239) to (253, 147).
; PLAN: r0=180(x1), r1=239(y1), r2=253(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 239
LDI r2, 253
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
