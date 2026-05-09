; DESCRIPTION: Places a yellow line segment connecting (444, 121) to (329, 207).
; PLAN: r0=444(x1), r1=121(y1), r2=329(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 121
LDI r2, 329
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
