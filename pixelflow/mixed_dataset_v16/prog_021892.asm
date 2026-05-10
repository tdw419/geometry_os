; DESCRIPTION: Places a yellow line segment connecting (268, 240) to (231, 249).
; PLAN: r0=268(x1), r1=240(y1), r2=231(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 240
LDI r2, 231
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
