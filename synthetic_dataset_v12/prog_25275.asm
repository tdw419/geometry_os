; DESCRIPTION: Renders a magenta line between points (378, 173) and (459, 120).
; PLAN: r0=378(x1), r1=173(y1), r2=459(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 173
LDI r2, 459
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
