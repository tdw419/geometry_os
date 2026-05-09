; DESCRIPTION: Places a magenta line segment connecting (473, 161) to (393, 204).
; PLAN: r0=473(x1), r1=161(y1), r2=393(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 161
LDI r2, 393
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
