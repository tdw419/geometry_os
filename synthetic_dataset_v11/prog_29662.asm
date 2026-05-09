; DESCRIPTION: Places a yellow line segment connecting (243, 66) to (70, 89).
; PLAN: r0=243(x1), r1=66(y1), r2=70(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 66
LDI r2, 70
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
