; DESCRIPTION: Places a black line segment connecting (326, 209) to (495, 243).
; PLAN: r0=326(x1), r1=209(y1), r2=495(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 209
LDI r2, 495
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
