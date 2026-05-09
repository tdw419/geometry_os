; DESCRIPTION: Renders a magenta line between points (253, 107) and (220, 150).
; PLAN: r0=253(x1), r1=107(y1), r2=220(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 107
LDI r2, 220
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
