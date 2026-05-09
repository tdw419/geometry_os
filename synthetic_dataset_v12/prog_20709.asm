; DESCRIPTION: Places a green line segment connecting (183, 223) to (107, 65).
; PLAN: r0=183(x1), r1=223(y1), r2=107(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 223
LDI r2, 107
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
