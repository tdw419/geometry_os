; DESCRIPTION: Places a green line segment connecting (7, 112) to (42, 217).
; PLAN: r0=7(x1), r1=112(y1), r2=42(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 112
LDI r2, 42
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
