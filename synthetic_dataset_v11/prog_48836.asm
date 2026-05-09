; DESCRIPTION: Places a yellow line segment connecting (209, 186) to (183, 137).
; PLAN: r0=209(x1), r1=186(y1), r2=183(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 186
LDI r2, 183
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
