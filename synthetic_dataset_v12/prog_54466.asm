; DESCRIPTION: Draws a yellow line from (234, 255) to (152, 201).
; PLAN: r0=234(x1), r1=255(y1), r2=152(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 255
LDI r2, 152
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
