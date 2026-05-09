; DESCRIPTION: Renders a magenta line between points (180, 68) and (500, 120).
; PLAN: r0=180(x1), r1=68(y1), r2=500(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 68
LDI r2, 500
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
