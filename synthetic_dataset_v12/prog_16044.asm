; DESCRIPTION: Places a yellow line segment connecting (396, 117) to (439, 207).
; PLAN: r0=396(x1), r1=117(y1), r2=439(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 117
LDI r2, 439
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
