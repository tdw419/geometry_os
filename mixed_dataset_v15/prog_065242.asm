; DESCRIPTION: Places a yellow line segment connecting (288, 54) to (410, 229).
; PLAN: r0=288(x1), r1=54(y1), r2=410(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 54
LDI r2, 410
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
