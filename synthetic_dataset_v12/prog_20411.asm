; DESCRIPTION: Renders a magenta line between points (20, 167) and (38, 64).
; PLAN: r0=20(x1), r1=167(y1), r2=38(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 167
LDI r2, 38
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
