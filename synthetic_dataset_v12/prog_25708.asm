; DESCRIPTION: Renders a magenta line between points (437, 12) and (23, 75).
; PLAN: r0=437(x1), r1=12(y1), r2=23(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 12
LDI r2, 23
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
