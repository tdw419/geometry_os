; DESCRIPTION: Renders a magenta line between points (333, 22) and (129, 64).
; PLAN: r0=333(x1), r1=22(y1), r2=129(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 22
LDI r2, 129
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
