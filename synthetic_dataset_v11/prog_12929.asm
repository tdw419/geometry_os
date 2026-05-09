; DESCRIPTION: Places a red line segment connecting (22, 243) to (72, 225).
; PLAN: r0=22(x1), r1=243(y1), r2=72(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 243
LDI r2, 72
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
