; DESCRIPTION: Renders a magenta line between points (86, 107) and (12, 70).
; PLAN: r0=86(x1), r1=107(y1), r2=12(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 107
LDI r2, 12
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
