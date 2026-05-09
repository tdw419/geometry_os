; DESCRIPTION: Places a green line segment connecting (264, 184) to (465, 198).
; PLAN: r0=264(x1), r1=184(y1), r2=465(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 184
LDI r2, 465
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
