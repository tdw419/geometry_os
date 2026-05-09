; DESCRIPTION: Places a magenta line segment connecting (305, 208) to (204, 54).
; PLAN: r0=305(x1), r1=208(y1), r2=204(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 208
LDI r2, 204
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
