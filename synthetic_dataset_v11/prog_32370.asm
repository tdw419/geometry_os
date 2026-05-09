; DESCRIPTION: Places a black line segment connecting (176, 5) to (127, 46).
; PLAN: r0=176(x1), r1=5(y1), r2=127(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 5
LDI r2, 127
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
