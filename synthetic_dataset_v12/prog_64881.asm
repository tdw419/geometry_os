; DESCRIPTION: Places a blue line segment connecting (256, 219) to (79, 213).
; PLAN: r0=256(x1), r1=219(y1), r2=79(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 219
LDI r2, 79
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
