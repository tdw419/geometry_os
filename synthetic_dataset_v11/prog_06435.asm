; DESCRIPTION: Places a magenta line segment connecting (135, 104) to (208, 86).
; PLAN: r0=135(x1), r1=104(y1), r2=208(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 104
LDI r2, 208
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
