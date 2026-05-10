; DESCRIPTION: Places a purple line segment connecting (463, 165) to (281, 198).
; PLAN: r0=463(x1), r1=165(y1), r2=281(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 165
LDI r2, 281
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
