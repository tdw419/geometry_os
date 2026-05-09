; DESCRIPTION: Places a yellow line segment connecting (177, 204) to (492, 198).
; PLAN: r0=177(x1), r1=204(y1), r2=492(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 204
LDI r2, 492
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
