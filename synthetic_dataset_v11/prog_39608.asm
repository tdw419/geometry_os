; DESCRIPTION: Places a yellow line segment connecting (118, 154) to (117, 33).
; PLAN: r0=118(x1), r1=154(y1), r2=117(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 154
LDI r2, 117
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
