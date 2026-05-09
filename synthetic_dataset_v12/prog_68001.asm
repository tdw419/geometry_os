; DESCRIPTION: Renders a magenta line between points (500, 203) and (308, 20).
; PLAN: r0=500(x1), r1=203(y1), r2=308(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 203
LDI r2, 308
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
