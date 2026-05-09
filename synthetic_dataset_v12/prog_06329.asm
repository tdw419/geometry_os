; DESCRIPTION: Places a black line segment connecting (54, 141) to (127, 26).
; PLAN: r0=54(x1), r1=141(y1), r2=127(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 141
LDI r2, 127
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
