; DESCRIPTION: Places a green line segment connecting (124, 186) to (125, 52).
; PLAN: r0=124(x1), r1=186(y1), r2=125(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 186
LDI r2, 125
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
