; DESCRIPTION: Places a white line segment connecting (243, 223) to (132, 106).
; PLAN: r0=243(x1), r1=223(y1), r2=132(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 223
LDI r2, 132
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
