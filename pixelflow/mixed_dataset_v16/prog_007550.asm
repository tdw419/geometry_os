; DESCRIPTION: Renders a magenta line between points (313, 229) and (32, 81).
; PLAN: r0=313(x1), r1=229(y1), r2=32(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 229
LDI r2, 32
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
