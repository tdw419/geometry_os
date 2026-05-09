; DESCRIPTION: Places a blue line segment connecting (27, 46) to (456, 251).
; PLAN: r0=27(x1), r1=46(y1), r2=456(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 46
LDI r2, 456
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
