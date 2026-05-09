; DESCRIPTION: Renders a magenta line between points (405, 139) and (260, 109).
; PLAN: r0=405(x1), r1=139(y1), r2=260(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 139
LDI r2, 260
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
