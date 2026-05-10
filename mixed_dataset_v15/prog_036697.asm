; DESCRIPTION: Places a black line segment connecting (106, 59) to (273, 146).
; PLAN: r0=106(x1), r1=59(y1), r2=273(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 59
LDI r2, 273
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
