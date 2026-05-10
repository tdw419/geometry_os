; DESCRIPTION: Places a black line segment connecting (406, 127) to (168, 90).
; PLAN: r0=406(x1), r1=127(y1), r2=168(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 127
LDI r2, 168
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
