; DESCRIPTION: Places a magenta line segment connecting (48, 164) to (54, 242).
; PLAN: r0=48(x1), r1=164(y1), r2=54(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 164
LDI r2, 54
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
