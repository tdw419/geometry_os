; DESCRIPTION: Places a green line segment connecting (300, 183) to (330, 11).
; PLAN: r0=300(x1), r1=183(y1), r2=330(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 183
LDI r2, 330
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
