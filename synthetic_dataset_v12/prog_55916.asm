; DESCRIPTION: Places a purple line segment connecting (497, 180) to (320, 164).
; PLAN: r0=497(x1), r1=180(y1), r2=320(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 180
LDI r2, 320
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
