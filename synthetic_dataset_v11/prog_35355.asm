; DESCRIPTION: Places a yellow line segment connecting (16, 93) to (162, 132).
; PLAN: r0=16(x1), r1=93(y1), r2=162(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 93
LDI r2, 162
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
