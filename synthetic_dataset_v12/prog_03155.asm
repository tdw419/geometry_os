; DESCRIPTION: Places a green line segment connecting (7, 211) to (333, 19).
; PLAN: r0=7(x1), r1=211(y1), r2=333(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 211
LDI r2, 333
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
