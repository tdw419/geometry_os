; DESCRIPTION: Places a cyan line segment connecting (147, 251) to (86, 198).
; PLAN: r0=147(x1), r1=251(y1), r2=86(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 251
LDI r2, 86
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
