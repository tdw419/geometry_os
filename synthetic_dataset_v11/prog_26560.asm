; DESCRIPTION: Places a yellow line segment connecting (252, 236) to (196, 183).
; PLAN: r0=252(x1), r1=236(y1), r2=196(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 236
LDI r2, 196
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
