; DESCRIPTION: Places a green line segment connecting (66, 126) to (419, 198).
; PLAN: r0=66(x1), r1=126(y1), r2=419(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 126
LDI r2, 419
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
