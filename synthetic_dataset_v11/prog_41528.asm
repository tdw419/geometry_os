; DESCRIPTION: Places a green line segment connecting (233, 48) to (243, 169).
; PLAN: r0=233(x1), r1=48(y1), r2=243(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 48
LDI r2, 243
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
