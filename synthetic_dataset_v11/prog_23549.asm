; DESCRIPTION: Places a green line segment connecting (107, 44) to (35, 198).
; PLAN: r0=107(x1), r1=44(y1), r2=35(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 44
LDI r2, 35
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
