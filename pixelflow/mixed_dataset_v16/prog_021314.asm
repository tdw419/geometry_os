; DESCRIPTION: Places a magenta line segment connecting (271, 12) to (242, 25).
; PLAN: r0=271(x1), r1=12(y1), r2=242(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 12
LDI r2, 242
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
