; DESCRIPTION: Renders a magenta line between points (74, 56) and (205, 218).
; PLAN: r0=74(x1), r1=56(y1), r2=205(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 56
LDI r2, 205
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
