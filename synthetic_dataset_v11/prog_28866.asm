; DESCRIPTION: Places a magenta line segment connecting (69, 107) to (205, 146).
; PLAN: r0=69(x1), r1=107(y1), r2=205(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 107
LDI r2, 205
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
