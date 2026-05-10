; DESCRIPTION: Renders a magenta line between points (470, 248) and (403, 10).
; PLAN: r0=470(x1), r1=248(y1), r2=403(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 248
LDI r2, 403
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
