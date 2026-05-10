; DESCRIPTION: Places a green line segment connecting (196, 179) to (189, 65).
; PLAN: r0=196(x1), r1=179(y1), r2=189(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 179
LDI r2, 189
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
