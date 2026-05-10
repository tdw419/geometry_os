; DESCRIPTION: Places a purple line segment connecting (363, 52) to (284, 219).
; PLAN: r0=363(x1), r1=52(y1), r2=284(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 52
LDI r2, 284
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
