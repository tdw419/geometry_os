; DESCRIPTION: Places a black line segment connecting (68, 187) to (127, 248).
; PLAN: r0=68(x1), r1=187(y1), r2=127(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 187
LDI r2, 127
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
