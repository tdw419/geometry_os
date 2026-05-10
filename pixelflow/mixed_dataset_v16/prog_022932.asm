; DESCRIPTION: Draws a yellow line from (398, 112) to (152, 241).
; PLAN: r0=398(x1), r1=112(y1), r2=152(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 112
LDI r2, 152
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
