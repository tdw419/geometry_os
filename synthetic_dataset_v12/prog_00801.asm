; DESCRIPTION: Places a yellow line segment connecting (392, 207) to (193, 13).
; PLAN: r0=392(x1), r1=207(y1), r2=193(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 207
LDI r2, 193
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
