; DESCRIPTION: Places a green line segment connecting (127, 104) to (148, 117).
; PLAN: r0=127(x1), r1=104(y1), r2=148(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 104
LDI r2, 148
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
