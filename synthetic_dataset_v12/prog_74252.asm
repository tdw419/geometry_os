; DESCRIPTION: Places a magenta line segment connecting (205, 205) to (426, 68).
; PLAN: r0=205(x1), r1=205(y1), r2=426(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 205
LDI r2, 426
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
