; DESCRIPTION: Renders a magenta line between points (405, 107) and (119, 22).
; PLAN: r0=405(x1), r1=107(y1), r2=119(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 107
LDI r2, 119
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
