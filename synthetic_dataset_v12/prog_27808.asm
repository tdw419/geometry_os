; DESCRIPTION: Places a black line segment connecting (260, 23) to (202, 135).
; PLAN: r0=260(x1), r1=23(y1), r2=202(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 23
LDI r2, 202
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
