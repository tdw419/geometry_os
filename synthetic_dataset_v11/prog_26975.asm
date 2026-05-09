; DESCRIPTION: Places a green line segment connecting (223, 213) to (91, 229).
; PLAN: r0=223(x1), r1=213(y1), r2=91(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 213
LDI r2, 91
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
