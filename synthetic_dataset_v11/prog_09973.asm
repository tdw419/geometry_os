; DESCRIPTION: Draws a yellow line from (13, 23) to (152, 189).
; PLAN: r0=13(x1), r1=23(y1), r2=152(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 23
LDI r2, 152
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
