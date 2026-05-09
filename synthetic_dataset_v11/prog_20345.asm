; DESCRIPTION: Places a green line segment connecting (17, 177) to (75, 63).
; PLAN: r0=17(x1), r1=177(y1), r2=75(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 177
LDI r2, 75
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
