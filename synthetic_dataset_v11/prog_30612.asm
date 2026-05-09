; DESCRIPTION: Places a yellow line segment connecting (103, 152) to (160, 35).
; PLAN: r0=103(x1), r1=152(y1), r2=160(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 152
LDI r2, 160
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
