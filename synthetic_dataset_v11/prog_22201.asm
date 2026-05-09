; DESCRIPTION: Renders a magenta line between points (181, 223) and (86, 242).
; PLAN: r0=181(x1), r1=223(y1), r2=86(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 223
LDI r2, 86
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
