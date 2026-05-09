; DESCRIPTION: Places a yellow line segment connecting (502, 193) to (211, 46).
; PLAN: r0=502(x1), r1=193(y1), r2=211(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 193
LDI r2, 211
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
