; DESCRIPTION: Places a black line segment connecting (176, 231) to (426, 196).
; PLAN: r0=176(x1), r1=231(y1), r2=426(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 231
LDI r2, 426
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
