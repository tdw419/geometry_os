; DESCRIPTION: Places a blue line segment connecting (328, 180) to (219, 107).
; PLAN: r0=328(x1), r1=180(y1), r2=219(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 180
LDI r2, 219
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
