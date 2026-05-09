; DESCRIPTION: Places a yellow line segment connecting (236, 226) to (56, 134).
; PLAN: r0=236(x1), r1=226(y1), r2=56(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 226
LDI r2, 56
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
