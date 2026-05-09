; DESCRIPTION: Places a yellow line segment connecting (196, 215) to (134, 31).
; PLAN: r0=196(x1), r1=215(y1), r2=134(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 215
LDI r2, 134
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
