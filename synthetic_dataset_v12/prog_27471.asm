; DESCRIPTION: Places a magenta line segment connecting (470, 67) to (167, 221).
; PLAN: r0=470(x1), r1=67(y1), r2=167(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 67
LDI r2, 167
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
