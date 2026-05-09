; DESCRIPTION: Places a yellow line segment connecting (210, 48) to (162, 8).
; PLAN: r0=210(x1), r1=48(y1), r2=162(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 48
LDI r2, 162
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
