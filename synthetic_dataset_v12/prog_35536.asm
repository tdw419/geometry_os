; DESCRIPTION: Places a magenta line segment connecting (205, 152) to (373, 167).
; PLAN: r0=205(x1), r1=152(y1), r2=373(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 152
LDI r2, 373
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
