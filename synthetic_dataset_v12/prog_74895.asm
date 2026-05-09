; DESCRIPTION: Places a yellow line segment connecting (231, 196) to (191, 198).
; PLAN: r0=231(x1), r1=196(y1), r2=191(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 196
LDI r2, 191
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
