; DESCRIPTION: Places a yellow line segment connecting (196, 90) to (371, 26).
; PLAN: r0=196(x1), r1=90(y1), r2=371(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 90
LDI r2, 371
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
