; DESCRIPTION: Places a green line segment connecting (66, 65) to (230, 86).
; PLAN: r0=66(x1), r1=65(y1), r2=230(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 65
LDI r2, 230
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
