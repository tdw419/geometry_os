; DESCRIPTION: Places a magenta line segment connecting (368, 114) to (218, 32).
; PLAN: r0=368(x1), r1=114(y1), r2=218(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 114
LDI r2, 218
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
