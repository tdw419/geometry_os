; DESCRIPTION: Renders a magenta line between points (18, 70) and (115, 26).
; PLAN: r0=18(x1), r1=70(y1), r2=115(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 70
LDI r2, 115
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
