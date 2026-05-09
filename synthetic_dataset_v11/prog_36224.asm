; DESCRIPTION: Places a magenta line segment connecting (221, 205) to (91, 209).
; PLAN: r0=221(x1), r1=205(y1), r2=91(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 205
LDI r2, 91
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
