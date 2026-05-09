; DESCRIPTION: Places a yellow line segment connecting (106, 18) to (230, 57).
; PLAN: r0=106(x1), r1=18(y1), r2=230(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 18
LDI r2, 230
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
