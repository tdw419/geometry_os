; DESCRIPTION: Draws a green line from (152, 77) to (172, 160).
; PLAN: r0=152(x1), r1=77(y1), r2=172(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 77
LDI r2, 172
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
