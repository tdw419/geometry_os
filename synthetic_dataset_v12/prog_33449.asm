; DESCRIPTION: Places a green line segment connecting (212, 186) to (340, 24).
; PLAN: r0=212(x1), r1=186(y1), r2=340(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 186
LDI r2, 340
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
